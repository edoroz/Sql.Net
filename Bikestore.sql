


----Drop schema sales
----Create Schema sales
Go

----Select * From sys.schemas
----Where Name ='sales'
Go

----CREATE TABLE sales.stores(
----	store_id	INT IDENTITY(1,1)	PRIMARY KEY,
----	store_name	VARCHAR(100)		NOT NULL,
----	phone		VARCHAR(25),
----	email		VARCHAR(100),
----	street		VARCHAR(100),
----	city		VARCHAR(100),
----	[state]		VARCHAR(10),
----	zip_code	VARCHAR(5)
----);
Go

----CREATE TABLE sales.staffs(
----	staff_id	INT IDENTITY(1,1)	PRIMARY KEY,
----	first_name	VARCHAR(50)			NOT NULL,
----	last_name	VARCHAR(50)			NOT NULL,
----	email		VARCHAR(50)			NOT NULL UNIQUE,
----	phone		VARCHAR(25),
----	active		BIT					NOT NULL,
----	store_id	INT					NOT NULL,
----	manager_id	INT,

----	Foreign Key (store_id)		References sales.stores(store_id)	On Delete Cascade	On Update Cascade,
----	Foreign Key (manager_id)	References sales.staffs(staff_id)	On Delete No Action On Update No Action
----);
Go

----Create Schema production

----Create Table production.categories (
----	category_id		Int Identity(1,1)	Primary Key,
----	category_name	Varchar(50)			Not Null
----);
Go

----Insert Into sales.stores (store_name, phone, email, street, city, [state], zip_code)
----Values('Fordward','404-4444','fordandmore@gmail.com','404 Fotune Rd','Las Cruces','NM','70700');
Go

----Insert Into Sales.staffs (first_name, last_name, email, phone, active, store_id )
----Values
----('Abraham','Anthony','abeant@test.com','555-1111',1,1),
----('Brady'  ,'Blake'	,'bradbl@test.com','555-2222',1,2),
----('Cameron','Case'	,'camcas@test.com','555-3333',1,1),
----('Diana'  ,'Dion'	,'diadio@test.com','555-4444',1,1),
----('Erik'	  ,'Estrada','threeriest@test.com','555-5555',1,5)
----('Fiona'	  ,'Ferris','fionfer@test.com','555-666',1,1)
----('Gerald'	  ,'Gianca','gergian@test.com','555-777',1,1,9)
Go

----Select * From sales.staffs
----Select * From sales.stores
Go

----Delete From sales.stores
----Where store_id = 1
Go

----Set Identity_Insert sales.stores On;
----Insert Into sales.stores (store_id, store_name, phone, email, street, city, [state], zip_code)
----Values(10, 'The Main','555-1111','first0@testl.com','101 Main st','San Antonio','TX','70700')
----Set Identity_Insert sales.stores Off;
Go

----Create Table production.brands (
----	brand_id	Int Identity(1,1)	Primary Key,
----	brand_name	Varchar(50)			Not Null
----);
Go

----Create Table production.products (
----	product_id		Int Identity(1,1)	Primary Key,
----	product_Name	VarChar(100)		Not Null,
----	model_year		Smallint			Not Null,
----	list_price		Decimal(10,2)		Not Null,

----	brand_id		Int					Not Null,
----	category_id		Int					Not Null,

----	Foreign Key(brand_id)	 References production.brands(brand_id)			On Delete Cascade On Update Cascade,
----	Foreign Key(category_id) References production.categories(category_id)	On Delete Cascade On Update Cascade
----);
Go

----Create Table sales.customers(
----	customer_id Int Identity(1,1) Primary Key,
----	first_name	Varchar(50)	Not Null,
----	last_name	Varchar(50)	Not Null,
----	phone		Varchar(50)			,
----	email		Varchar(50)	Not Null,
----	street		Varchar(50)			,
----	city		Varchar(50)			,
----	[state]		Varchar(50)			,
----	zip_code	Varchar(5)
----);
Go

----Create Table sales.orders(
----	order_id		Int Identity(1,1) Primary key,
----	order_status	TinyInt Not Null,
----	order_date		Date	Not Null,
----	required_date	Date	Not Null,
----	shipped_date	Date	Not Null,
	
----	customer_id Int,
----	store_id	Int,
----	staff_id	Int,

----	Foreign Key (customer_id)	References sales.customers(customer_id) On Delete Cascade On Update Cascade,
----	Foreign Key (store_id)		References sales.stores(store_id)		On Delete Cascade On Update Cascade,
----	Foreign Key (staff_id)		References sales.staffs(staff_id)		On Delete No Action On Update No Action
----);
Go

----Create Table sales.order_items(
----	order_id	Int,
----	item_id		Int,
----	product_id	Int			  Not Null,
----	quantity	Int			  Not Null,
----	list_price	Decimal(10,2) Not Null,
----	discount	Decimal( 4,2) Not Null Default 0,
	
----	Primary Key (order_id, item_id),
----	Foreign Key (order_id)		References sales.orders(order_id)			On Delete Cascade On Update Cascade,
----	Foreign key (product_id)	References production.products(product_id)	On Delete Cascade On Update Cascade
----);
Go

----Create Table production.stocks(
----	store_id	Int,
----	product_id	Int,
----	quantity	Int,

----	Primary Key(store_id,product_id),
----	Foreign Key(store_id)		References sales.stores(store_id)			On Delete Cascade On Update Cascade,
----	Foreign Key(product_id)		References production.products(product_id)	On Delete Cascade On Update Cascade,
----);
Go

--Select  -- * For all without an alias
--	first_name	as 'Nombre(s)', 
--	last_name	as 'Apellido', 
--	email		as 'Correo', 
--	street		as 'Calle', 
--	city		as 'Ciudad', 
--	[state]		as 'Estado', 
--	zip_code	as 'Código Postal'
--From sales.customers
--Order by Ciudad
Go

--Select [state] As 'Estados', Count(*) As 'Totales'
--From sales.customers 
--Where [state] = 'CA'
--Group By [state]
--Order By first_name
Go

--Select city, Count(*) As 'Totals'
--From sales.customers
--Group By city Having Count(*) > 9
--Order By Totals Desc, city
Go

	--	2.- Sort Data 
	-- ORDER BY
--Select last_name, first_name, city, [state] As 'State'
--From sales.customers
--Order By Len(city )Desc, last_name
Go

	-- 3.- Limiting Rows
	-- OFFSET FETCH
--Select * --product_name As 'Producto', list_price As 'Price' 
--From production.products
--Order By product_id --Price, Producto

--OffSet 0 Rows
--Fetch Next 15 Rows Only
Go
	
	-- SELECT TOP
--Select Top 10  With Ties *
--From production.products
--Order By list_price Desc
Go

	-- 4.- Filtering Data
	-- DISTINCT		To remove duplicate values, NULLS are the same value 

--Select Distinct city, state
--From sales.customers
--Order By city