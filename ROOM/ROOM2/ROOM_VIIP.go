package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"sync"

	"github.com/gorilla/mux"
	"github.com/gorilla/websocket"
	"github.com/dgrijalva/jwt-go"
)

// JWT secret key
var jwtKey = []byte("secret_key")

// WebSocket upgrader
var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

// User represents a user in the chat
type User struct {
	Username string `json:"username"`
	Online   bool   `json:"online"`
}

// Message represents a chat message
type Message struct {
	Sender    string `json:"sender"`
	Content   string `json:"content"`
	ReplyToID string `json:"reply_to_id,omitempty"`
	Type      string `json:"type"` // text, image, video
}

// Claims represents JWT claims
type Claims struct {
	Username string `json:"username"`
	jwt.StandardClaims
}

var (
	clients   = make(map[*websocket.Conn]*User)
	broadcast = make(chan Message)
	mutex     = sync.Mutex{}
)

func main() {
	// Start router
	r := mux.NewRouter()

	// Routes
	r.HandleFunc("/login", handleLogin).Methods("POST")
	r.HandleFunc("/ws", handleWebSocket)

	// Start broadcast handler
	go handleMessages()

	// Start server
	fmt.Println("Server started on :8080")
	http.ListenAndServe(":8080", r)
}

// handleLogin authenticates users and returns a JWT token
func handleLogin(w http.ResponseWriter, r *http.Request) {
	var user User
	json.NewDecoder(r.Body).Decode(&user)

	if user.Username == "" {
		http.Error(w, "Username is required", http.StatusBadRequest)
		return
	}

	// Create JWT token
	claims := &Claims{
		Username: user.Username,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: 15000,
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenString, err := token.SignedString(jwtKey)
	if err != nil {
		http.Error(w, "Could not create token", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]string{"token": tokenString})
}

// handleWebSocket handles WebSocket connections
func handleWebSocket(w http.ResponseWriter, r *http.Request) {
	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		fmt.Printf("Error upgrading connection: %v\n", err)
		return
	}
	defer conn.Close()

	// Register client
	mutex.Lock()
	clients[conn] = &User{Online: true}
	mutex.Unlock()

	// Listen for messages
	for {
		var msg Message
		if err := conn.ReadJSON(&msg); err != nil {
			fmt.Printf("Error reading JSON: %v\n", err)
			mutex.Lock()
			delete(clients, conn)
			mutex.Unlock()
			break
		}
		broadcast <- msg
	}
}

// handleMessages broadcasts messages to all clients
func handleMessages() {
	for {
		msg := <-broadcast
		mutex.Lock()
		for conn := range clients {
			if err := conn.WriteJSON(msg); err != nil {
				fmt.Printf("Error writing JSON: %v\n", err)
				conn.Close()
				delete(clients, conn)
			}
		}
		mutex.Unlock()
	}
}
