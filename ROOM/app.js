document.addEventListener("DOMContentLoaded", () => {
  const loginScreen = document.getElementById("login-screen");
  const chatRoom = document.getElementById("chat-room");
  const loginBtn = document.getElementById("login-btn");
  const logoutBtn = document.getElementById("logout-btn");
  const sendBtn = document.getElementById("send-btn");
  const chatMessages = document.getElementById("chat-messages");
  const messageInput = document.getElementById("message");

  let username = "";

  // Login functionality
  loginBtn.addEventListener("click", () => {
    const usernameInput = document.getElementById("username").value;
    if (usernameInput.trim()) {
      username = usernameInput;
      loginScreen.classList.add("hidden");
      chatRoom.classList.remove("hidden");
    }
  });

  // Logout functionality
  logoutBtn.addEventListener("click", () => {
    chatRoom.classList.add("hidden");
    loginScreen.classList.remove("hidden");
  });

  // Send message
  sendBtn.addEventListener("click", () => {
    const message = messageInput.value.trim();
    if (message) {
      const msgElement = document.createElement("div");
      msgElement.textContent = `${username}: ${message}`;
      chatMessages.appendChild(msgElement);
      messageInput.value = "";
    }
  });

  // Upload photo
  document.getElementById("upload-photo-btn").addEventListener("click", () => {
    alert("Photo upload feature coming soon!");
  });

  // Upload video
  document.getElementById("upload-video-btn").addEventListener("click", () => {
    alert("Video upload feature coming soon!");
  });
});
