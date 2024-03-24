package models

type Lecturer struct {
	ID   string `json:"id" gorm:"primaryKey"`
	Name string `json:"name" binding:"required" form:"name"`
	City string `json:"city" binding:"required" form:"city"`
}
