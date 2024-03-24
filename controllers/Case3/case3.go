package case3

import (
	"Golang_CRUD_Native/config"
	"Golang_CRUD_Native/models"
	"net/http"

	"github.com/gin-gonic/gin"
)

func GetAllStudents(ctx *gin.Context) {
	db := config.ConnectDB(ctx)

	var data []models.Student
	db.Model(&models.Student{}).Find(&data)

	ctx.IndentedJSON(http.StatusOK, data)
}

func Index(ctx *gin.Context) {
	db := config.ConnectDB(ctx)
	var data []models.Student
	err := db.Preload("Scores.Course.Lecturer").Where("id =?", ctx.Query("id")).Find(&data).Error

	ctx.JSON(http.StatusOK, gin.H{
		"length":  ctx.Query("id"),
		"data":    data,
		"message": "Data Found.",
		"error":   err,
	})
}
