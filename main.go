package main

import (
	case3 "Golang_CRUD_Native/controllers/Case3"
	"log"

	"github.com/gin-gonic/gin"
)

func main() {
	route := gin.Default()

	// 	// students
	route.GET("/students/all", case3.GetAllStudents)
	route.GET("/students/:id", case3.GetStudentByID)

	log.Println("Server started on: http://localhost:8080")
	route.Run(":8080")
}
