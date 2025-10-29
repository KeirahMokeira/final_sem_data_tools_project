# 📗 Data Dictionary — Real Estate Sales Database

This data dictionary describes the structure and purpose of each table and column in the database.

---

## 🧍 Table: clients
| Column Name     | Data Type           | Description |
|-----------------|--------------------|--------------|
| client_id       | integer (PK)       | Unique ID for each client |
| first_name      | varchar(50)        | Client's first name |
| last_name       | varchar(50)        | Client's last name |
| nationality     | varchar(50)        | Country of origin |
| phone           | varchar(30)        | Client's phone number |
| email           | varchar(100)       | Client's email address |
| preferred_city  | varchar(50)        | City the client is interested in |
| budget          | numeric(12,2)      | Client’s estimated property budget |

---

## 🏠 Table: properties
| Column Name | Data Type      | Description |
|--------------|----------------|--------------|
| property_id  | integer (PK)   | Unique ID for each property |
| property_type| varchar(50)    | Type of property (e.g., Apartment, Plot) |
| city         | varchar(50)    | City where the property is located |
| location     | varchar(100)   | Specific area or neighborhood |
| price        | numeric(12,2)  | Price of the property |
| bedrooms     | integer        | Number of bedrooms |
| bathrooms    | integer        | Number of bathrooms |
| status       | varchar(20)    | Property status (Available / Sold) |

---

## 💰 Table: sales
| Column Name     | Data Type        | Description |
|-----------------|-----------------|--------------|
| sale_id         | integer (PK)    | Unique sale transaction ID |
| client_id       | integer (FK)    | References `clients.client_id` |
| property_id     | integer (FK)    | References `properties.property_id` |
| sale_date       | date            | Date when the sale/reservation occurred |
| status          | varchar(20)     | Sale status (Reserved / Sold) |
| amount_paid     | numeric(12,2)   | Amount paid by the client |
| payment_method  | varchar(50)     | Method of payment (Cash, Bank Transfer, etc.) |

---

## 🔗 Relationships
- **clients → sales:** One client can have many sales.
- **properties → sales:** One property can appear in one or more sales (until sold).
