package config

import (
	"log"

	"github.com/gin-gonic/gin"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func ConnectDB(ctx *gin.Context) (db *gorm.DB) {

	db, err := gorm.Open(mysql.Open("root:@tcp(127.0.0.1:3306)/go_lang_test?parseTime=true"), &gorm.Config{})
	if err != nil {
		ctx.AbortWithStatusJSON(500, gin.H{
			"message": "Database connection failed",
		})
		return
	}

	log.Println("Database connected")

	return db

}
