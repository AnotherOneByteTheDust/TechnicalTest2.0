package main

import (
	"fmt"
	"log"
	"net"
	"net/http"

	"github.com/google/uuid"
)

const port = ":8555"

func main() {
	ip_address := GetLocalIP()
	address := ip_address + port
	id := uuid.New().String()
	fmt.Println(id)
	fmt.Printf("Server running on: %s", address)

	mux := http.NewServeMux()
	mux.HandleFunc("/health", healthHandler(address, id))

	log.Fatal(http.ListenAndServe(port, mux))
}

func healthHandler(address string, id string) http.HandlerFunc {
	return func(w http.ResponseWriter, _ *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte(id + "\nServer running on: " + address))
	}
}

func GetLocalIP() string {
	addrs, err := net.InterfaceAddrs()
	if err != nil {
		return ""
	}
	for _, address := range addrs {
		// check the address type and if it is not a loopback the display it
		if ipnet, ok := address.(*net.IPNet); ok && !ipnet.IP.IsLoopback() {
			if ipnet.IP.To4() != nil {
				return ipnet.IP.String()
			}
		}
	}
	return ""
}
