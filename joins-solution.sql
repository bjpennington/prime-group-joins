-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

-- 2. Get all orders and their line items.
SELECT * FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id;

-- 3. Which warehouses have cheetos?
SELECT "warehouse".warehouse FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products"."description" = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse".warehouse FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products"."description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".first_name, "customers".last_name, count("customers".id) AS "orders" FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id
JOIN "orders" on "addresses".id = "orders".address_id
GROUP BY "customers".first_name, "customers".last_name;

-- 6. How many customers do we have?
SELECT count(*) AS "customers" FROM "customers";

-- 7. How many products do we carry?
SELECT count(*) AS "products" FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT sum("warehouse_product".on_hand) AS "diet_pepsi_quantity" FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi';
