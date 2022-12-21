package controllers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/mimron/gso/models"
	"gorm.io/gorm"
)

type OrderController struct {
	DB *gorm.DB
}

func NewOrderController(DB *gorm.DB) OrderController {
	return OrderController{DB}
}

func (pc *OrderController) FindOrders(ctx *gin.Context) {
	var page = ctx.DefaultQuery("page", "1")
	var limit = ctx.DefaultQuery("limit", "10")

	intPage, _ := strconv.Atoi(page)
	intLimit, _ := strconv.Atoi(limit)
	offset := (intPage - 1) * intLimit

	var orders []models.Order
	results := pc.DB.Limit(intLimit).Offset(offset).Joins("Customer").Joins("Employee").Joins("Shipping").Preload("OrderDetails").Preload("OrderDetails.Product").Find(&orders)
	if results.Error != nil {
		ctx.JSON(http.StatusBadGateway, gin.H{"status": "error", "message": results.Error})
		return
	}

	for i, row := range orders {
		var temp uint
		for _, val := range row.OrderDetails {
			var calculate = val.Quantity * val.UnitPrice
			temp = calculate + temp
		}
		orders[i].SubTotal = temp

	}

	ctx.JSON(http.StatusOK, gin.H{"status": "success", "results": len(orders), "data": orders})
}
