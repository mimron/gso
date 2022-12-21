package main

import (
	"fmt"
	"log"

	"github.com/mimron/gso/initializers"
	"github.com/mimron/gso/models"
)

func init() {
	config, err := initializers.LoadConfig(".")
	if err != nil {
		log.Fatal("🚀 Could not load environment variables", err)
	}

	initializers.ConnectDB(&config)
}

func main() {
	initializers.DB.AutoMigrate(&models.Customer{},
		&models.Employee{}, &models.Shipping{}, &models.Product{}, &models.Order{}, &models.OrderDetail{})
	fmt.Println("👍 Migration complete")
}
