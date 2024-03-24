package main

import (
	case3 "Golang_CRUD_Native/controllers/Case3"
	case5 "Golang_CRUD_Native/controllers/Case5"
	"log"

	"github.com/gin-gonic/gin"
)

func main() {
	token := &case5.Token{}

	route := gin.Default()

	// 	// students
	route.GET("/students/all", case3.GetAllStudents)
	route.GET("/students", case3.Index)

	route.GET("/task5/startconcurrency", token.Startconcurrency)
	route.GET("/task5/stopconcurrency", token.Stopconcurrency)
	route.GET("/task5", token.GetToken)

	log.Println("Server started on: http://localhost:8080")
	route.Run(":8080")
}
