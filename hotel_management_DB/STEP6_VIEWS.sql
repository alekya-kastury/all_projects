-------Customer View1---------------------
CREATE OR REPLACE VIEW Customer_View1 AS 
SELECT 
room.hotel_ID,
room.room_number,
room.room_availability,
hotel.Hotel_Name,
hotel.Hotel_Address_Street,
hotel.Hotel_Address_City,
hotel.Hotel_Address_State,
hotel.Hotel_Address_Zipcode,
hotel.Hotel_PhoneNumber,
hotel.Hotel_Description
FROM room inner join hotel on room.hotel_ID=hotel.Hotel_Id
WHERE room.room_availability='N';
select * from Customer_View1;

--------Customer View2---------------------
CREATE OR REPLACE VIEW Customer_View2 AS 
SELECT 
room.hotel_ID,
room.room_number,
room.room_availability,
hotel.Hotel_Name,
hotel.Hotel_Address_Street,
hotel.Hotel_Address_City,
hotel.Hotel_Address_State,
hotel.Hotel_Address_Zipcode,
hotel.Hotel_PhoneNumber,
hotel.Hotel_Description
FROM room inner join hotel on room.hotel_ID=hotel.Hotel_Id
WHERE room.room_availability='Y';
select * from Customer_View2;

---------------Customer View3---------------------
CREATE OR REPLACE VIEW Customer_View3 AS 
SELECT 
reservation.booking_id,
reservation.Customer_Id,
reservation.Hotel_Id,
reservation.Room_Id,
reservation.Package_Id,
reservation.CheckIn_Date,
reservation.CheckOut_Date,
reservation.NumberOf_People,
reservation.NumberOf_Nights,
reservation.Confirmation_Status,
feedback.feedback_id,
feedback.feedback
FROM reservation inner join feedback on reservation.booking_id=feedback.booking_id;
select * from Customer_View3;

-------------ADMIN VIEW-----------------------------
CREATE VIEW ADMIN_VIEW AS
SELECT
reservation.booking_id,
reservation.hotel_id,
reservation.checkout_date,
reservation.customer_id,
invoice.invoice_id,
invoice.total_bill_amount,
customer_info.customer_fname
FROM invoice 
inner join reservation on reservation.booking_id=invoice.booking_id 
inner join customer_info on customer_info.customer_id=reservation.customer_id 
where invoice.booking_id is not null;
select * from ADMIN_VIEW;

-------------House_Staff View---------------------
CREATE OR REPLACE VIEW HOTEL_STAFF_VIEW AS
SELECT 
additional_services_availed.additional_services_id,
additional_services_availed.booking_id, 
hotel.hotel_id, 
hotel.hotel_name, 
room_service.room_service_description, 
room.room_number
FROM ADDITIONAL_SERVICES_AVAILED
INNER JOIN  ROOM_SERVICE ON additional_services_availed.room_service_id=room_service.room_service_id
INNER JOIN RESERVATION ON additional_services_availed.booking_id=reservation.booking_id
INNER JOIN HOTEL ON reservation.hotel_id=hotel.hotel_id
INNER JOIN ROOM ON reservation.room_id=room.room_id;
select * from HOTEL_STAFF_VIEW;

------------Accounts_Monthly_Expenditures_View-------
CREATE OR REPLACE VIEW ACCOUNTS_EXPENDIURE_MONTHLY_VIEW AS
SELECT HOTEL.HOTEL_ID,HOTEL.HOTEL_NAME,
SUM(EMPLOYEE_INFO.EMPLOYEE_SALARY) AS EXPENDITURE, 
To_char(RESERVATION.checkout_date,'MONTH') AS MONTH_E
FROM HOTEL
INNER JOIN RESERVATION ON RESERVATION.HOTEL_ID=HOTEL.HOTEL_ID
INNER JOIN EMPLOYEE_INFO ON EMPLOYEE_INFO.HOTEL_ID=HOTEL.HOTEL_ID
GROUP BY HOTEL.HOTEL_ID,to_char(RESERVATION.checkout_date,'MONTH'),HOTEL.HOTEL_NAME
ORDER BY MONTH_E,HOTEL.HOTEL_ID;
select * from ACCOUNTS_EXPENDIURE_MONTHLY_VIEW;



---------Accounts_Monthly_Income_View-----------
CREATE OR REPLACE VIEW ACCOUNTS_INCOME_MONTHLY_VIEW AS
SELECT 
HOTEL.HOTEL_ID, HOTEL.HOTEL_NAME,
SUM(INVOICE.total_bill_amount) AS INCOME, 
to_char(RESERVATION.checkout_date,'MONTH') as MONTH_I
FROM HOTEL
INNER JOIN RESERVATION ON RESERVATION.HOTEL_ID=hotel.HOTEL_ID
INNER JOIN INVOICE ON INVOICE.booking_id=RESERVATION.booking_id
GROUP BY HOTEL.HOTEL_ID,to_char(RESERVATION.checkout_date,'MONTH'),HOTEL.HOTEL_NAME
ORDER BY MONTH_I;
select * from ACCOUNTS_INCOME_MONTHLY_VIEW;



-------Manager View1(customer lookup)-----

CREATE OR REPLACE VIEW Manager_View1 AS 
SELECT 
customer_info.customer_ID,
customer_info.customer_fname,
customer_info.customer_lname,
customer_info.customer_gender,
customer_info.customer_addressLine1,
customer_info.customer_phone,
customer_info.customer_numberOfVisits,
reservation.Booking_Id,
reservation.Hotel_Id,
reservation.Room_Id,
reservation.Confirmation_Status
FROM customer_info inner join reservation on customer_info.customer_ID=reservation.Customer_Id
WHERE reservation.Confirmation_Status='Booked';
select * from Manager_View1;

--------Manager View2(employee lookup)----

CREATE VIEW Manager_View2 AS 
SELECT 
employee_info.employee_ID,
employee_info.employee_fname,
employee_info.employee_lname,
employee_info.employee_gender,
employee_info.employee_DOB,
hotel.Hotel_Id,
hotel.Hotel_Name,
employee_info.employee_ID_number,
employee_info.employee_email,
employee_info.employee_phone,
employee_info.employee_designation,
employee_info.employee_salary,
hotel.Hotel_Address_Street,
hotel.Hotel_Address_City,
hotel.Hotel_Address_State,
hotel.Hotel_Address_Zipcode,
hotel.Hotel_PhoneNumber,
hotel.Hotel_Description
FROM hotel inner join employee_info on hotel.Hotel_Id=employee_info.hotel_ID;
select * from Manager_View2;

---------------Receptionist View-------------
CREATE OR REPLACE VIEW Receptionist_View AS 
SELECT 
customer_info.customer_ID,
customer_info.customer_fname,
customer_info.customer_lname,
customer_info.customer_gender,
customer_info.customer_phone,
reservation.Booking_Id,
reservation.Room_Id,
reservation.Confirmation_Status,
reservation.Package_Id,
reservation.CheckIn_Date,
reservation.CheckOut_Date,
reservation.NumberOf_People,
reservation.NumberOf_Nights
FROM customer_info inner join reservation on customer_info.customer_ID=reservation.Customer_Id
WHERE reservation.Confirmation_Status='Booked';
select * from Receptionist_View;

---NUMBER OF ROOMS BOOKED MONTHLY------
CREATE OR REPLACE VIEW ROOMS_BOOKED_MONTHLY_VIEW AS
SELECT 
HOTEL.HOTEL_ID,HOTEL.HOTEL_NAME,
COUNT(ROOM_ID) AS NUMBER_OF_ROOMS,
To_char(RESERVATION.checkout_date,'MONTH') AS MONTH_R
FROM RESERVATION
INNER JOIN HOTEL ON RESERVATION.hotel_id=hotel.hotel_id
WHERE RESERVATION.CONFIRMATION_STATUS='Booked'
GROUP BY HOTEL.HOTEL_ID,to_char(RESERVATION.checkout_date,'MONTH'),HOTEL.HOTEL_NAME
ORDER BY MONTH_R,HOTEL.HOTEL_ID;

select * from ROOMS_BOOKED_MONTHLY_VIEW;

---NUMBER OF EMPLOYEES IN EACH HOTEL---
CREATE OR REPLACE VIEW NUMBER_OF_EMPLOYEES_VIEW AS
SELECT 
HOTEL.HOTEL_ID, 
HOTEL.HOTEL_NAME, 
COUNT(EMPLOYEE_INFO.EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEES
FROM HOTEL 
INNER JOIN EMPLOYEE_INFO ON HOTEL.HOTEL_ID=EMPLOYEE_INFO.HOTEL_ID
GROUP BY HOTEL.HOTEL_ID, HOTEL.HOTEL_NAME
ORDER BY HOTEL.HOTEL_ID;

select * from NUMBER_OF_EMPLOYEES_VIEW;

---PACKAGES AVAILED AT EACH HOTEL----
CREATE OR REPLACE VIEW PACKAGES_AVAILED_AT_HOTEL AS
SELECT 
HOTEL.HOTEL_ID, 
HOTEL.HOTEL_NAME, 
PACKAGE_DEALS.PACKAGE_DESCRIPTION, 
COUNT(RESERVATION.PACKAGE_ID) AS NUMBER_OF_PACKAGES_BOOKED
FROM HOTEL
INNER JOIN RESERVATION ON HOTEL.HOTEL_ID = RESERVATION.HOTEL_ID
INNER JOIN PACKAGE_DEALS ON RESERVATION.PACKAGE_ID = PACKAGE_DEALS.PACKAGE_ID
GROUP BY HOTEL.HOTEL_ID, HOTEL.HOTEL_NAME,PACKAGE_DEALS.PACKAGE_DESCRIPTION
ORDER BY HOTEL.HOTEL_ID, HOTEL.HOTEL_NAME;

select * from PACKAGES_AVAILED_AT_HOTEL;

---INCOME FROM PACKAGES AVAILED AT EACH HOTEL---
CREATE OR REPLACE VIEW INCOME_FROM_PACKAGES_AVAILED_AT_HOTEL AS
SELECT HOTEL.HOTEL_ID, 
HOTEL.HOTEL_NAME, 
PACKAGE_DEALS.PACKAGE_DESCRIPTION, 
(COUNT(RESERVATION.PACKAGE_ID)*(PACKAGE_DEALS.PACKAGE_COST)) AS INCOME_GENERATED
FROM HOTEL
INNER JOIN RESERVATION ON HOTEL.HOTEL_ID = RESERVATION.HOTEL_ID
INNER JOIN PACKAGE_DEALS ON RESERVATION.PACKAGE_ID = PACKAGE_DEALS.PACKAGE_ID
GROUP BY HOTEL.HOTEL_ID, HOTEL.HOTEL_NAME,PACKAGE_DEALS.PACKAGE_DESCRIPTION,PACKAGE_DEALS.PACKAGE_COST
ORDER BY HOTEL.HOTEL_ID, HOTEL.HOTEL_NAME;

select * from INCOME_FROM_PACKAGES_AVAILED_AT_HOTEL;