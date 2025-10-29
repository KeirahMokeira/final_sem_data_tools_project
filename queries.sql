SELECT * FROM public.clients;

SELECT * FROM public.properties;

SELECT * FROM public.sales;

join tables 

SELECT 
  c.first_name,
  c.last_name,
  p.property_type,
  p.city,
  s.amount_paid,
  s.status AS sale_status,
  s.payment_method
FROM public.sales s
JOIN public.clients c ON s.client_id = c.client_id
JOIN public.properties p ON s.property_id = p.property_id;
