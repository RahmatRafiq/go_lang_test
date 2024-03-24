package case3

import (
	"Golang_CRUD_Native/config"
	"Golang_CRUD_Native/models"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

func GetAllStudents(ctx *gin.Context) {
	db := config.ConnectDB(ctx)

	var data []models.Student
	db.Model(&models.Student{}).Find(&data)

	ctx.IndentedJSON(http.StatusOK, data)
}

func GetStudentByID(ctx *gin.Context) {
	db := config.ConnectDB(ctx)

	// Ambil ID siswa dari parameter URL
	studentIDStr := ctx.Param("id")
	studentID, err := strconv.Atoi(studentIDStr)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{"error": "Invalid student ID"})
		return
	}

	// Query data nilai berdasarkan ID siswa
	var scores []models.Scores
	db.Where("student_id = ?", studentID).Find(&scores)

	if len(scores) == 0 {
		ctx.JSON(http.StatusNotFound, gin.H{"error": "Scores not found for the student"})
		return
	}

	// Ambil data terkait dari tabel courses dan lecturers
	var courses []models.Courses
	var lecturers []models.Lecturers
	for _, score := range scores {
		var course models.Courses
		db.First(&course, score.Course_id)
		courses = append(courses, course)

		var lecturer models.Lecturers
		db.First(&lecturer, course.Lecturer_id)
		lecturers = append(lecturers, lecturer)
	}

	// Ambil data siswa dari salah satu data nilai
	var student models.Student
	db.First(&student, scores[0].Student_id)

	// Masukkan data ke dalam response
	responseData := gin.H{
		"student":   student,
		"scores":    scores,
		"courses":   courses,
		"lecturers": lecturers,
	}

	ctx.JSON(http.StatusOK, responseData)
}
