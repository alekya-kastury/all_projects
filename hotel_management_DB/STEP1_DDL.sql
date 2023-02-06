SET SERVEROUT ON;

DECLARE record_count NUMBER;
BEGIN


-- create table HOTEL if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'HOTEL';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('HOTEL Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
ELSE
    execute immediate 'CREATE table HOTEL (
    Hotel_Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    Hotel_Name VARCHAR(25) not null,
    Hotel_Address_Street VARCHAR(25) not null,
    Hotel_Address_City VARCHAR(25) not null,
    Hotel_Address_State VARCHAR(25) not null,
    Hotel_Address_Zipcode VARCHAR(5) not null,
    Hotel_PhoneNumber VARCHAR(20) not null,
    Hotel_Description VARCHAR(100) not null,
    Rooms_Available NUMBER not null,
    Rooms_Unavailable NUMBER not null,
    Total_Rooms NUMBER not null,
    Base_Charge NUMBER not null,
    Constraint Hotel_PK PRIMARY KEY(Hotel_Id),
    Constraint Hotel_Branch_Unique UNIQUE(Hotel_Name,Hotel_Address_Street)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE HOTEL CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;

-- create table PACKAGE_DEALS if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'PACKAGE_DEALS';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('PACKAGE_DEALS Table already exists');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');        
ELSE
    execute immediate 'CREATE table PACKAGE_DEALS (
    package_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 400 INCREMENT BY 1) NOT NULL,
    package_description VARCHAR(50) NOT NULL,
    package_cost NUMBER NOT NULL,
    CONSTRAINT PACKAGE_DEALS_PK PRIMARY KEY(package_ID),
    CONSTRAINT PACKAGE_DEALS_UNIQUE_DESC UNIQUE (package_description)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE PACKAGE_DEALS CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('------------------------------------------');      
END if;


-- create table CUSTOMER_INFO if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'CUSTOMER_INFO';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('CUSTOMER_INFO Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
ELSE
    execute immediate 'CREATE table CUSTOMER_INFO (
    customer_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 500 INCREMENT BY 1) NOT NULL,
    customer_fname VARCHAR(25) NOT NULL,
    customer_lname VARCHAR(25) NOT NULL,
    customer_gender CHAR(1) NOT NULL,
    customer_addressLine1 VARCHAR(50) NOT NULL,
    customer_city VARCHAR(20) NOT NULL,
    customer_state VARCHAR(20) NOT NULL,
    customer_zipCode VARCHAR(5) NOT NULL,
    customer_email VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(20) NOT NULL,
    customer_isMember CHAR(1) NOT NULL,
    customer_ID_proof VARCHAR(50),
    customer_numberOfVisits NUMBER NOT NULL,
    CONSTRAINT CUSTOMER_INFO_PK PRIMARY KEY(customer_ID),
    CONSTRAINT CUSTOMER_INFO_UNIQUE UNIQUE (customer_email,customer_phone)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE CUSTOMER_INFO CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;


-- create table ROOM_TYPE if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'ROOM_TYPE';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('ROOM_TYPE Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    ELSE
    execute immediate 'CREATE table ROOM_TYPE (
    room_type_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 2100 INCREMENT BY 1) NOT NULL,
    room_type VARCHAR(25) NOT NULL,
    room_cost NUMBER NOT NULL,
    max_persons NUMBER NOT NULL,
    CONSTRAINT ROOM_TYPE_PK PRIMARY KEY(room_type_ID),
    CONSTRAINT ROOM_TYPE_UNIQUE UNIQUE (room_type)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE ROOM_TYPE CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;


-- create table ROOM if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'ROOM';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('ROOM Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    ELSE
    execute immediate 'CREATE table ROOM (
    room_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 700 INCREMENT BY 1) NOT NULL,
    hotel_ID NUMBER NOT NULL,
    room_type_ID NUMBER NOT NULL,
    room_number VARCHAR(10) NOT NULL,
    room_availability VARCHAR(1) NOT NULL,
    CONSTRAINT ROOM_PK PRIMARY KEY(room_ID),
    CONSTRAINT ROOM_FK_1 FOREIGN KEY(room_type_ID) REFERENCES ROOM_TYPE(room_type_ID),
    CONSTRAINT ROOM_UNIQUE UNIQUE (hotel_ID,room_number)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE ROOM CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;

-- create table if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'ROOM_SERVICE';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('ROOM_SERVICE Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
Else
    execute immediate 'CREATE table ROOM_SERVICE (
    ROOM_SERVICE_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1200 INCREMENT BY 1) NOT NULL,
    ROOM_SERVICE_DESCRIPTION VARCHAR(50),
    ROOM_SERVICE_COST NUMBER,
    HOTEL_ID NUMBER,
    CONSTRAINT ROOM_SERVICE_PK PRIMARY KEY(ROOM_SERVICE_ID),
    CONSTRAINT HOTELID_FK_3 FOREIGN KEY(HOTEL_ID) REFERENCES HOTEL(HOTEL_ID)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE ROOM_SERVICE CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
end if;


-- create table EMPLOYEE_INFO if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'EMPLOYEE_INFO';
IF(record_count > 0) THEN
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE_INFO Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
ELSE
  execute immediate 'CREATE table EMPLOYEE_INFO (
  employee_ID NUMBER GENERATED ALWAYS as IDENTITY(START with 901 INCREMENT by 1),
  hotel_ID NUMBER not null,
  employee_fname VARCHAR(25) not null,
  employee_lname VARCHAR(25) not null,
  employee_DOB DATE not null,
  employee_gender CHAR(1) not null,
  employee_addressLine1 VARCHAR(50) not null,
  employee_city VARCHAR(20) not null,
  employee_state VARCHAR(20) not null,
  employee_zipCode VARCHAR(5) not null,
  employee_email VARCHAR(50) not null,
  employee_phone VARCHAR(20) not null,
  employee_designation VARCHAR(25) not null,
  employee_salary NUMBER not null,
  employee_ID_type VARCHAR(50) not null,
  employee_ID_number NUMBER not null,
  CONSTRAINT EMPLOYEE_INFO_PK PRIMARY KEY(employee_ID),
  CONSTRAINT EMPLOYEE_INFO_FK FOREIGN KEY(hotel_ID) REFERENCES HOTEL(hotel_ID),
  CONSTRAINT EMPLOYEE_UNIQUE UNIQUE (employee_email,employee_phone))';
  DBMS_OUTPUT.PUT_LINE('TABLE EMPLOYEE_INFO CREATED SUCCESSFULLY');
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
end if;

-- create table RESERVATION if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'RESERVATION';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('RESERVATION Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
ELSE
    execute immediate 'CREATE table RESERVATION (
    Booking_Id NUMBER GENERATED ALWAYS as IDENTITY(START with 12301 INCREMENT by 1),
    Customer_Id NUMBER,
    Hotel_Id NUMBER,
    Room_Id NUMBER,
    Package_Id NUMBER,
    CheckIn_Date DATE not null,
    CheckOut_Date DATE not null,
    NumberOf_People NUMBER not null,
    NumberOf_Nights NUMBER not null,
    Confirmation_Status VARCHAR(20),
    Constraint Booking_PK PRIMARY KEY(Booking_Id),
    CONSTRAINT CUSTOMERID_FK_1 FOREIGN KEY(Customer_Id) REFERENCES CUSTOMER_INFO(Customer_Id),
    CONSTRAINT HOTELID_FK_1 FOREIGN KEY(Hotel_Id) REFERENCES HOTEL(Hotel_Id),
    CONSTRAINT ROOMID_FK_1 FOREIGN KEY(Room_Id) REFERENCES ROOM(Room_Id),
    CONSTRAINT PACKAGEID_FK_1 FOREIGN KEY(Package_Id) REFERENCES PACKAGE_DEALS(Package_Id)
    )';
    DBMS_OUTPUT.PUT_LINE('TABLE RESERVATION CREATED SUCCESSFULLY');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;

-- create table if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'ADDITIONAL_SERVICES_AVAILED';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('ADDITIONAL_SERVICES_AVAILED Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
Else
    execute immediate 'CREATE table ADDITIONAL_SERVICES_AVAILED (
    ADDITIONAL_SERVICES_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1300 INCREMENT BY 1) NOT NULL,
    ROOM_SERVICE_ID NUMBER ,
    BOOKING_ID NUMBER,
    ADDITIONAL_COST NUMBER,
    CONSTRAINT ADDITIONAL_SERVICES_PK PRIMARY KEY(ADDITIONAL_SERVICES_ID),
    CONSTRAINT RSID_FK_3 FOREIGN KEY(ROOM_SERVICE_ID) REFERENCES ROOM_SERVICE(ROOM_SERVICE_ID),
    CONSTRAINT HOTELID_FK_2 FOREIGN KEY(BOOKING_ID) REFERENCES RESERVATION(BOOKING_ID)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE ADDITIONAL_SERVICES_AVAILED CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
end if;

-- create table FEEDBACK if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'FEEDBACK';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('FEEDBACK Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    ELSE
    execute immediate 'CREATE table FEEDBACK (
    feedback_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 800 INCREMENT BY 1) NOT NULL,
    booking_ID NUMBER NOT NULL,
    feedback VARCHAR(250) NOT NULL,
    CONSTRAINT FEEDBACK_PK PRIMARY KEY(feedback_ID),
    CONSTRAINT BOOKINGID_FK_1 FOREIGN KEY(booking_ID) REFERENCES RESERVATION(booking_ID)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE FEEDBACK CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;

-- create table CANCELLATION if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'CANCELLATION';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('CANCELLATION Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
ELSE
    execute immediate 'CREATE table CANCELLATION (
    cancellation_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1000 INCREMENT BY 1) NOT NULL,
    booking_ID NUMBER NOT NULL,
    reason VARCHAR(250) NOT NULL,
    cancellation_Date Date NOT NULL,
    CONSTRAINT CANCELLATION_INFO_PK PRIMARY KEY(cancellation_ID),
    CONSTRAINT CANCELLATION_UNIQUE UNIQUE (reason,cancellation_Date),
    CONSTRAINT BOOKINGID_FK_2 FOREIGN KEY(booking_ID) REFERENCES RESERVATION(booking_ID)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE CANCELLATION CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;

-- create table INVOICE if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'INVOICE';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('INVOICE Table already exists');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');        
ELSE
    execute immediate 'CREATE table INVOICE (
    invoice_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1100 INCREMENT BY 1) NOT NULL,
    booking_ID NUMBER NOT NULL,
    reservation_Amount NUMBER NOT NULL,
    additional_Services_Amount NUMBER NOT NULL,
    total_bill_Amount NUMBER NOT NULL,
    payment_Method VARCHAR(50) NOT NULL,
    CONSTRAINT INVOICE_PK PRIMARY KEY(invoice_ID),
    CONSTRAINT INVOICE_UNIQUE_DESC UNIQUE (total_bill_Amount),
    CONSTRAINT BOOKINGID_FK_3 FOREIGN KEY(booking_ID) REFERENCES RESERVATION(booking_ID)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE INVOICE CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('------------------------------------------');      
END if;

END;

