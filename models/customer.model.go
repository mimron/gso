package models

import (
	"time"
)

type Customer struct {
	ID                  uint      `gorm:"primary_key" json:"id,omitempty"`
	CompanyName         string    `gorm:"type:varchar(50)"`
	FirstName           string    `gorm:"type:varchar(30)"`
	LastName            string    `gorm:"type:varchar(50)"`
	BillingAddress      string    `gorm:"type:varchar(255)"`
	City                string    `gorm:"type:varchar(50)"`
	StateOrProvince     string    `gorm:"type:varchar(20)"`
	ZipCode             string    `gorm:"type:varchar(20)"`
	Email               string    `gorm:"uniqueIndex"`
	CompanyWebsite      string    `gorm:"type:varchar(200)"`
	PhoneNumber         string    `gorm:"type:varchar(30)"`
	FaxNumber           string    `gorm:"type:varchar(30)"`
	ShipAddress         string    `gorm:"type:varchar(255)"`
	ShipCity            string    `gorm:"type:varchar(50)"`
	ShipStateOrProvince string    `gorm:"type:varchar(50)"`
	ShipZipCode         string    `gorm:"type:varchar(20)"`
	ShipPhoneNumber     string    `gorm:"type:varchar(30)"`
	CreatedAt           time.Time `gorm:"not null" json:"created_at,omitempty"`
	UpdatedAt           time.Time `gorm:"not null" json:"updated_at,omitempty"`
	Orders              []Order
}
