package models

import (
	"time"
)

type Product struct {
	ID          uint
	ProductName string
	UnitPrice   uint
	InStock     uint8
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
