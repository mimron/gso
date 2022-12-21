package models

import (
	"time"
)

type Order struct {
	ID              uint
	OrderDate       time.Time
	OrderNumber     string
	ShipDate        time.Time
	FreightCharge   uint
	Taxes           uint
	PaymentReceived string
	Comment         string
	CreatedAt       time.Time
	UpdatedAt       time.Time
	CustomerID      uint
	Customer        Customer
	EmployeeID      uint
	Employee        Employee
	ShippingID      uint
	Shipping        Shipping
	OrderDetails    []OrderDetail
	SubTotal        uint `gorm:"-:all"`
}
