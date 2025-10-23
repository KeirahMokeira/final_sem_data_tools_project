# 🏠 Real Estate Sales Database (Supabase Project)

## 📌 Overview
This project is a simple **real estate sales database** built using **Supabase (PostgreSQL)**.  
It manages clients, property listings, and sales transactions.  
The goal is to demonstrate relational database design — including foreign keys, relationships, and SQL queries.

---

## 🗂️ Database Schema
The database includes **three tables**:

1. **clients** — Stores customer details such as name, contact info, and budget.  
2. **properties** — Contains property details like type, city, price, and availability.  
3. **sales** — Records property sales or reservations, linking clients to properties.

---

## 🔗 Relationships
- Each sale is linked to **one client** and **one property**.
- A client can have **multiple sales**.
- Foreign keys:
  - `sales.client_id → clients.client_id`
  - `sales.property_id → properties.property_id`

---

## ⚙️ How to Set Up
1. Open [Supabase](https://supabase.com/).
2. Create a new project.
3. Open the **SQL Editor** and paste the contents of `schema.sql`.
4. Run the **INSERT** statements to add sample data.
5. Use the example queries in `queries.sql` to test.

---

## 🧠 Example Queries
```sql
SELECT * FROM clients;
SELECT * FROM properties WHERE status = 'Available';
SELECT * FROM sales;
