package main

import (
	"log"
	"net/http"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/mimron/gso/controllers"
	"github.com/mimron/gso/initializers"
	"github.com/mimron/gso/routes"
)

var (
	server               *gin.Engine
	OrderController      controllers.OrderController
	OrderRouteController routes.OrderRouteController
)

func init() {
	config, err := initializers.LoadConfig(".")
	if err != nil {
		log.Fatal("🚀 Could not load environment variables", err)
	}

	initializers.ConnectDB(&config)

	OrderController = controllers.NewOrderController(initializers.DB)
	OrderRouteController = routes.NewRouteOrderController(OrderController)

	server = gin.Default()
	server.SetTrustedProxies(nil)
}

func main() {
	config, err := initializers.LoadConfig(".")
	if err != nil {
		log.Fatal("🚀 Could not load environment variables", err)
	}

	corsConfig := cors.DefaultConfig()
	corsConfig.AllowOrigins = []string{"http://localhost:8001", config.ClientOrigin}
	corsConfig.AllowCredentials = true

	server.Use(cors.New(corsConfig))

	router := server.Group("/api")
	router.GET("/healthchecker", func(ctx *gin.Context) {
		message := "Welcome to Golang with Gorm and Postgres"
		ctx.JSON(http.StatusOK, gin.H{"status": "success", "message": message})
	})

	OrderRouteController.OrderRoute(router)
	log.Fatal(server.Run(":" + config.ServerPort))
}
