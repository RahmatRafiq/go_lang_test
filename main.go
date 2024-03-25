package main

import (
	"Golang_CRUD_Native/routes"
	"log"
)

func main() {
	route := routes.Routes()

	log.Println("Server started on: http://localhost:8080")
	route.Run(":8080")
}
