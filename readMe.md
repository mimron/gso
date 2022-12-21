# GSO - Test golang service order

## Requirements

- [Golang](https://go.dev) >=  install golang 
- [Docker](https://www.docker.com/) install go to the docker website and download the installer

## First Time Installation

Clone the repo:

```bash
git clone https://github.com/mimron/gso.git
cd gso
```

Install the dependencies:
```bash
go mod tidy
```

Set the environment variables:
```bash
cp example.env app.env
# copy then open .env and modify the environment variables (if needed)
```

Install database server inside docker:
```bash
docker-compose up -d
```

Create database name, table and seed data dummy:
```bash
go run migrate/migrate.go
# create table and database name
go run migrate/seed/seeder.go
# seed data dummy
```

Running Program:
```bash
go run main
```

## Development
Running program when development mode:
```bash
air
```

Access Api:
```bash
curl --location --request GET 'http://127.0.0.1:8001/api/orders'
```



Write SQL Query to get these data:
- List of customers located in Irvine city.
```bash
SELECT
	first_name, last_name, city
FROM
	customers 
WHERE
	city = 'irvine';
```
- List of customers whose order is handled by an employee named Adam Barr.
```bash
SELECT
	customers.ID,
	customers.first_name,
	customers.last_name ,
	last_orders.first_name as employee_name
FROM
	customers
	JOIN (
	SELECT
		o.* ,
		e.first_name 
	FROM
		orders o
		JOIN employees e ON e.ID = o.employee_id 
	WHERE
		o.ID IN ( SELECT MAX ( ID ) FROM orders GROUP BY customer_id ) 
		AND e.first_name = 'adam' 
	) AS last_orders ON customers.ID = last_orders.customer_id 
ORDER BY
	customer_id;
```
- List of products which are ordered by "Contonso, Ltd" Company.
```bash
SELECT
	mp.product_name, 
	po.company_name
FROM
	products mp
	JOIN (
		SELECT c.company_name, o.id, od.product_id
		FROM customers c 
		JOIN orders o ON o.customer_id = c.id 
		JOIN order_details od ON od.order_id = o.id 
		WHERE c.company_name LIKE '%Contonso, Ltd%' 
	) AS po ON po.product_id = mp.id;
```
- List of transactions (orders) which has "UPS Ground" as shipping method.
```bash
SELECT o.id as order_id, o.order_number, s.shipping_method
FROM orders o
JOIN shippings s on s.id = o.shipping_id
WHERE s.shipping_method like '%ups ground%';
```
- List of total cost (including tax and freight charge) for every order sorted by ship date.
```bash
SELECT o.id as order_id, o.order_number, o.order_date, o.taxes, o.freight_charge, (o.taxes + o.freight_charge) as total_cost, sub_total,
(o.taxes + o.freight_charge) + sub_total as grand_total
FROM orders o
 JOIN (
	SELECT order_id,
  SUM((quantity * unit_price) - discount) AS sub_total
	FROM order_details
	GROUP BY order_id
	ORDER BY SUM(unit_price) DESC
) as od on od.order_id = o.id
ORDER BY o.order_date DESC;
```