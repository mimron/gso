package models

import (
	"time"
)

type Employee struct {
	ID        uint      `gorm:"primary_key" json:"id,omitempty"`
	FirstName string    `gorm:"type:varchar(50)"`
	LastName  string    `gorm:"type:varchar(50)"`
	Title     string    `gorm:"type:varchar(50)"`
	WorkPhone string    `gorm:"type:varchar(30)"`
	CreatedAt time.Time `gorm:"not null" json:"created_at,omitempty"`
	UpdatedAt time.Time `gorm:"not null" json:"updated_at,omitempty"`
}
