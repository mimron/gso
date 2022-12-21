package models

import (
	"time"
)

type OrderDetail struct {
	ID        uint `gorm:"primary_key" json:"id,omitempty"`
	OrderID   uint
	Order     *Order
	ProductID uint
	Product   Product
	Quantity  uint      `gorm:"not null"`
	UnitPrice uint      `gorm:"not null"`
	Discount  uint      `gorm:"not null"`
	CreatedAt time.Time `gorm:"not null" json:"created_at,omitempty"`
	UpdatedAt time.Time `gorm:"not null" json:"updated_at,omitempty"`
}
