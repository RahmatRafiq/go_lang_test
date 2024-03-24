package models

type StudentScore struct {
	Student   Student    `json:"student"`
	Scores    []Score    `json:"scores"`
	Courses   []Course   `json:"courses"`
	Lecturers []Lecturer `json:"lecturers"`
}

type Student struct {
	ID          string  `json:"id" gorm:"primaryKey"`
	StudentName string  `json:"student_name" binding:"required" form:"student_name"`
	City        string  `json:"city" binding:"required" form:"city"`
	Scores      []Score `json:"scores" gorm:"foreignKey:Student_id"`
}
