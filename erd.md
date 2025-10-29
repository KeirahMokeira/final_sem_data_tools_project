# Real Estate Management ERD

```mermaid
erDiagram
    CLIENTS {
        int client_id
        string first_name
        string last_name
        string nationality
        string phone
        string email
        string preferred_city
        numeric budget
    }

    PROPERTIES {
        int property_id
        string property_type
        string city
        string location
        numeric price
        int bedrooms
        int bathrooms
        string status
    }

    SALES {
        int sale_id
        int client_id
        int property_id
        date sale_date
        string status
        numeric amount_paid
        string payment_method
    }

    CLIENTS ||--o{ SALES : "makes"
    PROPERTIES ||--o{ SALES : "is_sold_in"

