# Online-E-Commerce-Database


This project is a **relational database** designed for an **online e-commerce platform**. It includes tables for managing users, products, orders, and transactions using SQL.

## Features
- **User Management** (Registration, Login, and Authentication)
- **Product Catalog** (Stores product details like name, price, and description)
- **Order System** (Users can place and manage orders)
- **Transaction History** (Stores payment and order details)
- **Secure Database Design** (Uses primary keys and foreign key constraints)

## Database Schema
### **Tables Included:**
1. `users` - Stores user information (ID, username, email, password, creation date)
2. `products` - Stores product details (ID, name, price, description, timestamp)
3. `orders` - Stores order details (ID, user ID, product ID, quantity, order date)
4. `transactions` - Stores transaction details (ID, order ID, amount, status, payment method)

## Installation
### **Prerequisites**
- MySQL or any SQL-compatible database system
- SQL Client (MySQL Workbench, phpMyAdmin, or CLI)

### **Steps to Run the Database**
1. Download `dbms.sql` file.
2. Open your MySQL client.
3. Create a new database:
   ```sql
   CREATE DATABASE ecommerce_db;
