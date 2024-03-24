package models

type Course struct {
	ID          string   `json:"id" gorm:"primaryKey"`
	Name        string   `json:"name" binding:"required" form:"name"`
	Lecturer_id string   `json:"lecturer_id" binding:"required" form:"lecturer_id"`
	Credits     string   `json:"credits" binding:"required" form:"credits"`
	Lecturer    Lecturer `json:"lecturer" gorm:"foreignKey:Lecturer_id"`
}
