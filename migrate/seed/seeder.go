package main

import (
	"fmt"
	"log"
	"time"

	"github.com/mimron/gso/initializers"
	"github.com/mimron/gso/models"
)

var customers = []models.Customer{
	{
		ID:                  1,
		CompanyName:         "Contonso, Ltd",
		FirstName:           "Budi",
		LastName:            "Doremi",
		BillingAddress:      "jl test",
		City:                "irvine",
		StateOrProvince:     "DKI Jakarta",
		ZipCode:             "1232",
		Email:               "budi@email.com",
		CompanyWebsite:      "contonso.com",
		PhoneNumber:         "3423423423",
		FaxNumber:           "12345",
		ShipAddress:         "Jl Testing",
		ShipCity:            "irvine",
		ShipStateOrProvince: "irvine",
		ShipZipCode:         "12345",
		ShipPhoneNumber:     "4354353454",
	},
	{
		ID:                  2,
		CompanyName:         "Amazon, Ltd",
		FirstName:           "Adama",
		LastName:            "Selipsky",
		BillingAddress:      "jl test",
		City:                "Texas",
		StateOrProvince:     "Texas",
		ZipCode:             "1232",
		Email:               "adama@email.com",
		CompanyWebsite:      "Amazon.com",
		PhoneNumber:         "3423423423",
		FaxNumber:           "12345",
		ShipAddress:         "Jl Testing",
		ShipCity:            "Texas",
		ShipStateOrProvince: "Texas",
		ShipZipCode:         "12345",
		ShipPhoneNumber:     "4354353454",
	},
	{
		ID:                  3,
		CompanyName:         "Facebook Inc",
		FirstName:           "Mark",
		LastName:            "Zugerberg",
		BillingAddress:      "Dobbs Ferry",
		City:                "New York",
		StateOrProvince:     "New York",
		ZipCode:             "1232",
		Email:               "mark@email.com",
		CompanyWebsite:      "facebook.com",
		PhoneNumber:         "3423423423",
		FaxNumber:           "12345",
		ShipAddress:         "Street Testing",
		ShipCity:            "New York",
		ShipStateOrProvince: "New York",
		ShipZipCode:         "12345",
		ShipPhoneNumber:     "4354353454",
	},
}

var employees = []models.Employee{
	{
		ID:        1,
		FirstName: "adam",
		LastName:  "barr",
		Title:     "admin",
		WorkPhone: "0812345679",
	},
	{
		ID:        2,
		FirstName: "dani",
		LastName:  "septian",
		Title:     "admin",
		WorkPhone: "43857483",
	},
}

var shippings = []models.Shipping{
	{
		ID:             1,
		ShippingMethod: "ups ground",
	},
	{
		ID:             2,
		ShippingMethod: "fedex",
	},
}

var products = []models.Product{
	{
		ID:          1,
		ProductName: "eearphone",
		UnitPrice:   1000000,
		InStock:     100,
	},
	{
		ID:          2,
		ProductName: "xiaomi headseat",
		UnitPrice:   500000,
		InStock:     100,
	},
}

var orders = []models.Order{
	{
		ID:              1,
		CustomerID:      1,
		EmployeeID:      1,
		ShippingID:      1,
		OrderDate:       time.Now(),
		OrderNumber:     "ORDER001",
		ShipDate:        time.Now(),
		FreightCharge:   10000,
		Taxes:           1000,
		PaymentReceived: "1",
		Comment:         "notes test",
	},
	{
		ID:              2,
		CustomerID:      1,
		EmployeeID:      1,
		ShippingID:      1,
		OrderDate:       time.Now(),
		OrderNumber:     "ORDER002",
		ShipDate:        time.Now(),
		FreightCharge:   7000,
		Taxes:           1000,
		PaymentReceived: "1",
		Comment:         "notes test",
	},
}

var orderDetails = []models.OrderDetail{
	{
		ID:        1,
		OrderID:   1,
		ProductID: 1,
		Quantity:  5,
		UnitPrice: 1000000,
		Discount:  0,
	},
	{
		ID:        2,
		OrderID:   1,
		ProductID: 2,
		Quantity:  5,
		UnitPrice: 500000,
		Discount:  0,
	},
}

func init() {
	config, err := initializers.LoadConfig(".")
	if err != nil {
		log.Fatal("🚀 Could not load environment variables", err)
	}

	initializers.ConnectDB(&config)
}

func main() {

	initializers.DB.Delete(&orderDetails, []int{1, 2, 3})
	initializers.DB.Delete(&orders, []int{1, 2, 3})
	initializers.DB.Delete(&products, []int{1, 2, 3})
	initializers.DB.Delete(&shippings, []int{1, 2, 3})
	initializers.DB.Delete(&employees, []int{1, 2, 3})
	initializers.DB.Delete(&customers, []int{1, 2, 3})

	initializers.DB.AutoMigrate(&models.Customer{},
		&models.Employee{}, &models.Shipping{}, &models.Product{}, &models.Order{}, &models.OrderDetail{})

	for i := range customers {

		result := initializers.DB.Create(&customers[i])
		if result.Error != nil {
			log.Fatalf("cannot seed customers table: %v", result.Error.Error())

		}

	}

	for i := range employees {

		result := initializers.DB.Create(&employees[i])
		if result.Error != nil {
			log.Fatalf("cannot seed employees table: %v", result.Error.Error())

		}

	}

	for i := range shippings {

		result := initializers.DB.Create(&shippings[i])
		if result.Error != nil {
			log.Fatalf("cannot seed shippings table: %v", result.Error.Error())

		}

	}

	for i := range products {

		result := initializers.DB.Create(&products[i])
		if result.Error != nil {
			log.Fatalf("cannot seed products table: %v", result.Error.Error())

		}

	}

	for i := range orders {

		result := initializers.DB.Create(&orders[i])
		if result.Error != nil {
			log.Fatalf("cannot seed orders table: %v", result.Error.Error())

		}

	}

	for i := range orderDetails {

		result := initializers.DB.Create(&orderDetails[i])
		if result.Error != nil {
			log.Fatalf("cannot seed orderDetails table: %v", result.Error.Error())

		}

	}

	fmt.Println("👍 Seed complete")
}
