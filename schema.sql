clients table 

create table public.clients (
  client_id integer generated always as identity not null,
  first_name character varying(50) not null,
  last_name character varying(50) null,
  nationality character varying(50) null,
  phone character varying(30) null,
  email character varying(100) null,
  preferred_city character varying(50) null,
  budget numeric(12, 2) null,2
  constraint clients_pkey primary key (client_id)
) TABLESPACE pg_default;

INSERT INTO "public"."clients" ("client_id", "first_name", "last_name", "nationality", "phone", "email", "preferred_city", "budget") VALUES ('1', 'Mary', 'Achieng', 'Kenyan', '+254712345001', 'mary.achieng@gmail.com', 'Nairobi', '9000000.00'), ('2', 'John', 'Mwangi', 'Kenyan', '+254722345002', 'john.mwangi@gmail.com', 'Nakuru', '13000000.00'), ('3', 'Jane', 'Smith', 'British', '+447900345003', 'jane.smith@outlook.com', 'Mombasa', '22000000.00'), ('4', 'Liu', 'Wei', 'Chinese', '+861380045004', 'liu.wei@qq.com', 'Nairobi', '8500000.00'), ('5', 'Carlos', 'Mendez', 'Spanish', '+34650055005', 'carlos.mendez@gmail.com', 'Kisumu', '5000000.00'), ('6', 'Sarah', 'Njeri', 'Kenyan', '+254733450006', 'sarah.njeri@gmail.com', 'Nairobi', '10000000.00'), ('7', 'David', 'Omondi', 'Kenyan', '+254701230007', 'david.omondi@gmail.com', 'Eldoret', '9500000.00'), ('8', 'Emily', 'Johnson', 'American', '+12025550108', 'emily.johnson@yahoo.com', 'Mombasa', '21000000.00'), ('9', 'Amina', 'Ali', 'Somali', '+252614550009', 'amina.ali@gmail.com', 'Nairobi', '8800000.00'), ('10', 'Peter', 'Otieno', 'Kenyan', '+254711550010', 'peter.otieno@gmail.com', 'Nakuru', '12500000.00'), ('11', 'Hassan', 'Abdi', 'Kenyan', '+254701670011', 'hassan.abdi@gmail.com', 'Nairobi', '7500000.00'), ('12', 'Laura', 'Schmidt', 'German', '+491520120012', 'laura.schmidt@gmail.com', 'Mombasa', '19500000.00'), ('13', 'Ahmed', 'Khan', 'Pakistani', '+923335670013', 'ahmed.khan@gmail.com', 'Nakuru', '14000000.00'), ('14', 'Grace', 'Chebet', 'Kenyan', '+254725340014', 'grace.chebet@gmail.com', 'Eldoret', '9700000.00'), ('15', 'Chloe', 'Martin', 'French', '+336250450015', 'chloe.martin@gmail.com', 'Nairobi', '11000000.00');


properties table

create table public.properties (
  property_id integer generated always as identity not null,
  property_type character varying(50) null,
  city character varying(50) null,
  location character varying(100) null,
  price numeric(12, 2) null,
  bedrooms integer null,
  bathrooms integer null,
  status character varying(20) null default 'Available'::character varying,
  constraint properties_pkey primary key (property_id)
) TABLESPACE pg_default;

INSERT INTO "public"."properties" ("property_id", "property_type", "city", "location", "price", "bedrooms", "bathrooms", "status") VALUES ('1', 'Apartment', 'Nairobi', 'Kilimani', '8500000.00', '2', '2', 'Available'), ('2', 'Townhouse', 'Nakuru', 'Milimani', '12500000.00', '4', '3', 'Available'), ('3', 'Bungalow', 'Eldoret', 'Kapsoya', '9500000.00', '3', '2', 'Available'), ('4', 'Villa', 'Mombasa', 'Nyali', '20000000.00', '5', '4', 'Available'), ('5', 'Studio', 'Kisumu', 'Tom Mboya Estate', '4500000.00', '1', '1', 'Available'), ('6', 'Maisonette', 'Nairobi', 'Lavington', '15000000.00', '4', '3', 'Available'), ('7', 'Apartment', 'Nakuru', 'Section 58', '7800000.00', '3', '2', 'Available'), ('8', 'Cottage', 'Nanyuki', 'Mt. Kenya View', '10500000.00', '3', '2', 'Available'), ('9', 'Villa', 'Malindi', 'Casuarina', '18000000.00', '5', '4', 'Available'), ('10', 'Bungalow', 'Thika', 'Landless Estate', '6800000.00', '3', '2', 'Available'), ('11', 'Penthouse', 'Nairobi', 'Westlands', '22000000.00', '4', '4', 'Available'), ('12', 'Apartment', 'Eldoret', 'Elgon View', '8900000.00', '3', '2', 'Available');

sales table

create table public.sales (
  sale_id integer generated always as identity not null,
  client_id integer null,
  property_id integer null,
  sale_date date null default CURRENT_DATE,
  status character varying(20) null default 'Reserved'::character varying,
  amount_paid numeric(12, 2) null,
  payment_method character varying(50) null,
  constraint sales_pkey primary key (sale_id),
  constraint sales_client_id_fkey foreign KEY (client_id) references clients (client_id) on delete CASCADE,
  constraint sales_property_id_fkey foreign KEY (property_id) references properties (property_id) on delete CASCADE,
  constraint sales_status_check check (
    (
      (status)::text = any (
        (
          array[
            'Reserved'::character varying,
            'Sold'::character varying
          ]
        )::text[]
      )
    )
  )
) TABLESPACE pg_default;

INSERT INTO "public"."sales" ("sale_id", "client_id", "property_id", "sale_date", "status", "amount_paid", "payment_method") VALUES ('9', '1', '1', '2025-10-01', 'Reserved', '2000000.00', 'Bank Transfer'), ('10', '2', '2', '2025-09-20', 'Sold', '12500000.00', 'Bank Loan'), ('11', '3', '4', '2025-09-15', 'Sold', '20000000.00', 'Wire Transfer'), ('12', '4', '1', '2025-10-05', 'Reserved', '850000.00', 'Cash Deposit'), ('13', '5', '5', '2025-10-10', 'Sold', '4500000.00', 'Cash'), ('14', '6', '6', '2025-09-25', 'Reserved', '5000000.00', 'Mobile Money'), ('15', '7', '3', '2025-10-12', 'Sold', '9500000.00', 'Bank Transfer'), ('16', '8', '4', '2025-10-15', 'Reserved', '10000000.00', 'Credit Card');