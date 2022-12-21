/*
 Navicat Premium Data Transfer

 Source Server         : DEV_DOCKER_POSTGRES
 Source Server Type    : PostgreSQL
 Source Server Version : 140005
 Source Host           : 127.0.0.1:6500
 Source Catalog        : golang-gorm
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140005
 File Encoding         : 65001

 Date: 22/12/2022 00:40:55
*/


-- ----------------------------
-- Sequence structure for customers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."customers_id_seq";
CREATE SEQUENCE "public"."customers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."customers_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for employees_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."employees_id_seq";
CREATE SEQUENCE "public"."employees_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."employees_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for order_details_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."order_details_id_seq";
CREATE SEQUENCE "public"."order_details_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."order_details_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for orders_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."orders_id_seq";
CREATE SEQUENCE "public"."orders_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."orders_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."products_id_seq";
CREATE SEQUENCE "public"."products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."products_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for shippings_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."shippings_id_seq";
CREATE SEQUENCE "public"."shippings_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."shippings_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS "public"."customers";
CREATE TABLE "public"."customers" (
  "id" int8 NOT NULL DEFAULT nextval('customers_id_seq'::regclass),
  "company_name" varchar(50) COLLATE "pg_catalog"."default",
  "first_name" varchar(30) COLLATE "pg_catalog"."default",
  "last_name" varchar(50) COLLATE "pg_catalog"."default",
  "billing_address" varchar(255) COLLATE "pg_catalog"."default",
  "city" varchar(50) COLLATE "pg_catalog"."default",
  "state_or_province" varchar(20) COLLATE "pg_catalog"."default",
  "zip_code" varchar(20) COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default",
  "company_website" varchar(200) COLLATE "pg_catalog"."default",
  "phone_number" varchar(30) COLLATE "pg_catalog"."default",
  "fax_number" varchar(30) COLLATE "pg_catalog"."default",
  "ship_address" varchar(255) COLLATE "pg_catalog"."default",
  "ship_city" varchar(50) COLLATE "pg_catalog"."default",
  "ship_state_or_province" varchar(50) COLLATE "pg_catalog"."default",
  "ship_zip_code" varchar(20) COLLATE "pg_catalog"."default",
  "ship_phone_number" varchar(30) COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL
)
;
ALTER TABLE "public"."customers" OWNER TO "postgres";

-- ----------------------------
-- Records of customers
-- ----------------------------
BEGIN;
INSERT INTO "public"."customers" ("id", "company_name", "first_name", "last_name", "billing_address", "city", "state_or_province", "zip_code", "email", "company_website", "phone_number", "fax_number", "ship_address", "ship_city", "ship_state_or_province", "ship_zip_code", "ship_phone_number", "created_at", "updated_at") VALUES (1, 'Contonso, Ltd', 'Budi', 'Doremi', 'jl test', 'irvine', 'DKI Jakarta', '1232', 'budi@email.com', 'contonso.com', '3423423423', '12345', 'Jl Testing', 'irvine', 'irvine', '12345', '4354353454', '2022-12-21 17:29:06.225415+00', '2022-12-21 17:29:06.225415+00');
INSERT INTO "public"."customers" ("id", "company_name", "first_name", "last_name", "billing_address", "city", "state_or_province", "zip_code", "email", "company_website", "phone_number", "fax_number", "ship_address", "ship_city", "ship_state_or_province", "ship_zip_code", "ship_phone_number", "created_at", "updated_at") VALUES (2, 'Amazon, Ltd', 'Adama', 'Selipsky', 'jl test', 'Texas', 'Texas', '1232', 'adama@email.com', 'Amazon.com', '3423423423', '12345', 'Jl Testing', 'Texas', 'Texas', '12345', '4354353454', '2022-12-21 17:29:06.230015+00', '2022-12-21 17:29:06.230015+00');
INSERT INTO "public"."customers" ("id", "company_name", "first_name", "last_name", "billing_address", "city", "state_or_province", "zip_code", "email", "company_website", "phone_number", "fax_number", "ship_address", "ship_city", "ship_state_or_province", "ship_zip_code", "ship_phone_number", "created_at", "updated_at") VALUES (3, 'Facebook Inc', 'Mark', 'Zugerberg', 'Dobbs Ferry', 'New York', 'New York', '1232', 'mark@email.com', 'facebook.com', '3423423423', '12345', 'Street Testing', 'New York', 'New York', '12345', '4354353454', '2022-12-21 17:29:06.233273+00', '2022-12-21 17:29:06.233273+00');
COMMIT;

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS "public"."employees";
CREATE TABLE "public"."employees" (
  "id" int8 NOT NULL DEFAULT nextval('employees_id_seq'::regclass),
  "first_name" varchar(50) COLLATE "pg_catalog"."default",
  "last_name" varchar(50) COLLATE "pg_catalog"."default",
  "title" varchar(50) COLLATE "pg_catalog"."default",
  "work_phone" varchar(30) COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL
)
;
ALTER TABLE "public"."employees" OWNER TO "postgres";

-- ----------------------------
-- Records of employees
-- ----------------------------
BEGIN;
INSERT INTO "public"."employees" ("id", "first_name", "last_name", "title", "work_phone", "created_at", "updated_at") VALUES (1, 'adam', 'barr', 'admin', '0812345679', '2022-12-21 17:29:06.236369+00', '2022-12-21 17:29:06.236369+00');
INSERT INTO "public"."employees" ("id", "first_name", "last_name", "title", "work_phone", "created_at", "updated_at") VALUES (2, 'dani', 'septian', 'admin', '43857483', '2022-12-21 17:29:06.240335+00', '2022-12-21 17:29:06.240335+00');
COMMIT;

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_details";
CREATE TABLE "public"."order_details" (
  "id" int8 NOT NULL DEFAULT nextval('order_details_id_seq'::regclass),
  "order_id" int8,
  "product_id" int8,
  "quantity" int8 NOT NULL,
  "unit_price" int8 NOT NULL,
  "discount" int8 NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL
)
;
ALTER TABLE "public"."order_details" OWNER TO "postgres";

-- ----------------------------
-- Records of order_details
-- ----------------------------
BEGIN;
INSERT INTO "public"."order_details" ("id", "order_id", "product_id", "quantity", "unit_price", "discount", "created_at", "updated_at") VALUES (1, 1, 1, 5, 1000000, 0, '2022-12-21 17:29:06.264188+00', '2022-12-21 17:29:06.264188+00');
INSERT INTO "public"."order_details" ("id", "order_id", "product_id", "quantity", "unit_price", "discount", "created_at", "updated_at") VALUES (2, 1, 2, 5, 500000, 0, '2022-12-21 17:29:06.268105+00', '2022-12-21 17:29:06.268105+00');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."orders";
CREATE TABLE "public"."orders" (
  "id" int8 NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
  "order_date" timestamptz(6),
  "order_number" text COLLATE "pg_catalog"."default",
  "ship_date" timestamptz(6),
  "freight_charge" int8,
  "taxes" int8,
  "payment_received" text COLLATE "pg_catalog"."default",
  "comment" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6),
  "updated_at" timestamptz(6),
  "customer_id" int8,
  "employee_id" int8,
  "shipping_id" int8
)
;
ALTER TABLE "public"."orders" OWNER TO "postgres";

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO "public"."orders" ("id", "order_date", "order_number", "ship_date", "freight_charge", "taxes", "payment_received", "comment", "created_at", "updated_at", "customer_id", "employee_id", "shipping_id") VALUES (1, '2022-12-21 17:29:05.761673+00', 'ORDER001', '2022-12-21 17:29:05.761678+00', 10000, 1000, '1', 'notes test', '2022-12-21 17:29:06.256944+00', '2022-12-21 17:29:06.256944+00', 1, 1, 1);
INSERT INTO "public"."orders" ("id", "order_date", "order_number", "ship_date", "freight_charge", "taxes", "payment_received", "comment", "created_at", "updated_at", "customer_id", "employee_id", "shipping_id") VALUES (2, '2022-12-21 17:29:05.761678+00', 'ORDER002', '2022-12-21 17:29:05.761681+00', 7000, 1000, '1', 'notes test', '2022-12-21 17:29:06.261136+00', '2022-12-21 17:29:06.261136+00', 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS "public"."products";
CREATE TABLE "public"."products" (
  "id" int8 NOT NULL DEFAULT nextval('products_id_seq'::regclass),
  "product_name" text COLLATE "pg_catalog"."default",
  "unit_price" int8,
  "in_stock" int2,
  "created_at" timestamptz(6),
  "updated_at" timestamptz(6)
)
;
ALTER TABLE "public"."products" OWNER TO "postgres";

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO "public"."products" ("id", "product_name", "unit_price", "in_stock", "created_at", "updated_at") VALUES (1, 'eearphone', 1000000, 100, '2022-12-21 17:29:06.249977+00', '2022-12-21 17:29:06.249977+00');
INSERT INTO "public"."products" ("id", "product_name", "unit_price", "in_stock", "created_at", "updated_at") VALUES (2, 'xiaomi headseat', 500000, 100, '2022-12-21 17:29:06.253944+00', '2022-12-21 17:29:06.253944+00');
COMMIT;

-- ----------------------------
-- Table structure for shippings
-- ----------------------------
DROP TABLE IF EXISTS "public"."shippings";
CREATE TABLE "public"."shippings" (
  "id" int8 NOT NULL DEFAULT nextval('shippings_id_seq'::regclass),
  "shipping_method" varchar(20) COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL
)
;
ALTER TABLE "public"."shippings" OWNER TO "postgres";

-- ----------------------------
-- Records of shippings
-- ----------------------------
BEGIN;
INSERT INTO "public"."shippings" ("id", "shipping_method", "created_at", "updated_at") VALUES (1, 'ups ground', '2022-12-21 17:29:06.243353+00', '2022-12-21 17:29:06.243353+00');
INSERT INTO "public"."shippings" ("id", "shipping_method", "created_at", "updated_at") VALUES (2, 'fedex', '2022-12-21 17:29:06.247038+00', '2022-12-21 17:29:06.247038+00');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."customers_id_seq"
OWNED BY "public"."customers"."id";
SELECT setval('"public"."customers_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."employees_id_seq"
OWNED BY "public"."employees"."id";
SELECT setval('"public"."employees_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."order_details_id_seq"
OWNED BY "public"."order_details"."id";
SELECT setval('"public"."order_details_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."orders_id_seq"
OWNED BY "public"."orders"."id";
SELECT setval('"public"."orders_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."products_id_seq"
OWNED BY "public"."products"."id";
SELECT setval('"public"."products_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."shippings_id_seq"
OWNED BY "public"."shippings"."id";
SELECT setval('"public"."shippings_id_seq"', 1, false);

-- ----------------------------
-- Indexes structure for table customers
-- ----------------------------
CREATE UNIQUE INDEX "idx_customers_email" ON "public"."customers" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table customers
-- ----------------------------
ALTER TABLE "public"."customers" ADD CONSTRAINT "customers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table employees
-- ----------------------------
ALTER TABLE "public"."employees" ADD CONSTRAINT "employees_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table order_details
-- ----------------------------
ALTER TABLE "public"."order_details" ADD CONSTRAINT "order_details_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table products
-- ----------------------------
ALTER TABLE "public"."products" ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table shippings
-- ----------------------------
ALTER TABLE "public"."shippings" ADD CONSTRAINT "shippings_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table order_details
-- ----------------------------
ALTER TABLE "public"."order_details" ADD CONSTRAINT "fk_order_details_product" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."order_details" ADD CONSTRAINT "fk_orders_order_details" FOREIGN KEY ("order_id") REFERENCES "public"."orders" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "fk_customers_orders" FOREIGN KEY ("customer_id") REFERENCES "public"."customers" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."orders" ADD CONSTRAINT "fk_orders_employee" FOREIGN KEY ("employee_id") REFERENCES "public"."employees" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."orders" ADD CONSTRAINT "fk_orders_shipping" FOREIGN KEY ("shipping_id") REFERENCES "public"."shippings" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
