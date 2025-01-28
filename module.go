package main

import (
	"fmt"
	"os"
	"os/exec"
)

// Daftar modul yang akan di-install
var modules = []string{
	"github.com/gin-gonic/gin",        // Framework web
	"github.com/spf13/cobra",          // Library CLI
	"github.com/projectdiscovery/httpx/cmd/httpx", // OSINT HTTP scanner
}

// Fungsi untuk menjalankan perintah shell
func runCommand(name string, args ...string) error {
	cmd := exec.Command(name, args...)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}

// Fungsi untuk menginstal module Golang
func installModule(module string) {
	fmt.Printf("Menginstal module: %s...\n", module)
	err := runCommand("go", "get", module)
	if err != nil {
		fmt.Printf("Gagal menginstal module: %s. Error: %s\n", module, err)
	} else {
		fmt.Printf("Berhasil menginstal module: %s\n", module)
	}
}

func main() {
	fmt.Println("=== Golang Module Installer ===")

	// Cek apakah Go terinstal
	_, err := exec.LookPath("go")
	if err != nil {
		fmt.Println("Golang tidak ditemukan. Pastikan Anda telah menginstalnya.")
		os.Exit(1)
	}

	// Loop untuk menginstal semua module
	for _, module := range modules {
		installModule(module)
	}

	fmt.Println("Semua module selesai diinstal.")
}
