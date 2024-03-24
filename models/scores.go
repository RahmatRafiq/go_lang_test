package models

type Score struct {
	ID         string `json:"id" gorm:"primaryKey"`
	Course_id  string `json:"course_id" binding:"required" form:"course_id"`
	Student_id string `json:"student_id" binding:"required" form:"student_id"`
	Score      string `json:"score" binding:"required" form:"score"`
	Type       string `json:"type" binding:"required" form:"type"`
	Exam_date  string `json:"exam_date" binding:"required" form:"exam_date"`
	Course     Course `json:"course" gorm:"foreignKey:Course_id"`
}
