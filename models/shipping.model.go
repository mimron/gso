package models

import (
	"time"
)

type Shipping struct {
	ID             uint      `gorm:"primary_key" json:"id,omitempty"`
	ShippingMethod string    `gorm:"type:varchar(20)"`
	CreatedAt      time.Time `gorm:"not null" json:"created_at,omitempty"`
	UpdatedAt      time.Time `gorm:"not null" json:"updated_at,omitempty"`
}
