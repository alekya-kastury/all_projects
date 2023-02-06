SET SERVEROUT ON;

CREATE OR REPLACE PACKAGE INSERT_TABLES
AS
PROCEDURE INSERT_PACKAGE_DEALS(package_description in VARCHAR, package_cost in NUMBER);
PROCEDURE INSERT_CUSTOMER_INFO(customer_fname in VARCHAR, customer_lname in VARCHAR, customer_gender in CHAR, customer_addressLine1 in VARCHAR,  customer_city in VARCHAR, customer_state in VARCHAR,  customer_zipCode in VARCHAR, customer_email in VARCHAR, customer_phone in VARCHAR, customer_isMember in CHAR, customer_ID_proof in VARCHAR, customer_numberOfVisits in NUMBER);
PROCEDURE INSERT_HOTEL(Hotel_Name IN VARCHAR,Hotel_Address_Street IN VARCHAR,Hotel_Address_City IN VARCHAR,Hotel_Address_State IN VARCHAR,Hotel_Address_Zipcode IN VARCHAR,Hotel_PhoneNumber IN VARCHAR,Hotel_Description IN VARCHAR,Base_Charge IN NUMBER);
PROCEDURE INSERT_RESERVATION(Customer_Id IN NUMBER,Hotel_Id IN NUMBER,Room_Id IN NUMBER,Package_Id IN NUMBER,CheckIn_Date IN DATE,CheckOut_Date IN DATE,NumberOf_People IN NUMBER,NumberOf_Nights IN NUMBER);
PROCEDURE INSERT_EMPLOYEE_INFO(hotel_id in number,employee_fname in VARCHAR,employee_lname in VARCHAR,employee_DOB in date,employee_gender in char,employee_addressLine1 in VARCHAR,employee_city in VARCHAR,employee_state in VARCHAR,employee_zipCode in VARCHAR,employee_email in VARCHAR,employee_phone in VARCHAR,employee_designation in VARCHAR,employee_salary in number,employee_ID_type in VARCHAR,employee_ID_number in number);
PROCEDURE INSERT_FEEDBACK(booking_ID in NUMBER, feedback in VARCHAR);
PROCEDURE INSERT_ROOM(hotel_ID in NUMBER, room_type_ID in NUMBER, room_number in VARCHAR, room_availability in VARCHAR);
PROCEDURE INSERT_ROOM_TYPE(room_type in VARCHAR, room_cost in NUMBER, max_persons in NUMBER);
PROCEDURE INSERT_INVOICE(booking_ID1 IN NUMBER,payment_Method IN VARCHAR);
PROCEDURE INSERT_CANCELLATION(booking_ID IN NUMBER,reason IN VARCHAR,cancellation_Date IN DATE);
PROCEDURE INSERT_ADDITIONAL_SERVICES_AVAILED (ROOM_SERVICE_ID IN NUMBER, BOOKING_ID IN NUMBER);
PROCEDURE INSERT_ROOM_SERVICES (ROOM_SERVICE_DESCRIPTION IN VARCHAR, ROOM_SERVICE_COST IN NUMBER, HOTEL_ID IN NUMBER);

end INSERT_TABLES;
/

------------------------------------------------PACKAGE_DEALS INSERT----------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY INSERT_TABLES
AS
PROCEDURE INSERT_PACKAGE_DEALS(package_description in VARCHAR, package_cost in NUMBER)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO PACKAGE_DEALS(package_description, package_cost) VALUES (package_description, package_cost); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in PACKAGE_DEALS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into PACKAGE_DEALS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_PACKAGE_DEALS;

------------------------------------------------CUSTOMER_INFO INSERT----------------------------------------------------------------------------
PROCEDURE INSERT_CUSTOMER_INFO(customer_fname in VARCHAR, customer_lname in VARCHAR, customer_gender in CHAR, customer_addressLine1 in VARCHAR,  customer_city in VARCHAR, customer_state in VARCHAR,  customer_zipCode in VARCHAR, customer_email in VARCHAR, customer_phone in VARCHAR, customer_isMember in CHAR, customer_ID_proof in VARCHAR, customer_numberOfVisits in NUMBER)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO CUSTOMER_INFO(customer_fname, customer_lname, customer_gender, customer_addressLine1,  customer_city, customer_state,  customer_zipCode, customer_email, customer_phone, customer_isMember, customer_ID_proof, customer_numberOfVisits) VALUES (customer_fname, customer_lname, customer_gender, customer_addressLine1,  customer_city, customer_state,  customer_zipCode, customer_email, customer_phone, customer_isMember, customer_ID_proof, customer_numberOfVisits); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in CUSTOMER_INFO Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into CUSTOMER_INFO Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_CUSTOMER_INFO;

------------------------------------------------HOTEL DETAILS INSERT----------------------------------------------------------------------------
PROCEDURE INSERT_HOTEL(Hotel_Name IN VARCHAR,Hotel_Address_Street IN VARCHAR,Hotel_Address_City IN VARCHAR,Hotel_Address_State IN VARCHAR,Hotel_Address_Zipcode IN VARCHAR,Hotel_PhoneNumber IN VARCHAR,Hotel_Description IN VARCHAR,Base_Charge IN NUMBER)
AS
phno_exp EXCEPTION;
zip_exp EXCEPTION;
phno_char_exp EXCEPTION;
INVALID_STATE EXCEPTION;
INVALID_CITY EXCEPTION;
BEGIN
    IF VALIDATE_CONVERSION(Hotel_PhoneNumber AS NUMBER)=0 THEN
        RAISE phno_char_exp;
    END IF;
    IF LENGTH(TRIM(Hotel_PhoneNumber))<>10 THEN
        RAISE phno_exp;
    END IF;
    IF LENGTH(TRIM(Hotel_Address_Zipcode))<>5 THEN
        RAISE zip_exp;
    END IF;
    IF HOTEL_ADDRESS_STATE NOT IN ('MA','CA','NY') THEN
        RAISE INVALID_STATE;
    END IF;
    IF HOTEL_ADDRESS_STATE ='MA' AND UPPER(HOTEL_ADDRESS_CITY) NOT IN ('BOSTON','CAMBRIDGE') THEN
    RAISE INVALID_CITY;
    END IF;
    IF HOTEL_ADDRESS_STATE ='CA' AND UPPER(HOTEL_ADDRESS_CITY) NOT IN ('LOS ANGELES','SAN FRANCISCO','SAN DEIGO') THEN
    RAISE INVALID_CITY;
    END IF;
    IF HOTEL_ADDRESS_STATE ='NY' AND UPPER(HOTEL_ADDRESS_CITY) NOT IN ('NEW YORK') THEN
    RAISE INVALID_CITY;
    END IF;
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    INSERT INTO HOTEL(Hotel_Name,Hotel_Address_Street,Hotel_Address_City,Hotel_Address_State,Hotel_Address_Zipcode,Hotel_PhoneNumber,Hotel_Description,
    Rooms_Available,Rooms_Unavailable,Total_Rooms,Base_Charge) values(Hotel_Name,Hotel_Address_Street,Hotel_Address_City,Hotel_Address_State,Hotel_Address_Zipcode,Hotel_PhoneNumber,Hotel_Description,
    0,0,0,Base_Charge);
    DBMS_OUTPUT.PUT_LINE('ROWS INSERTED INTO HOTEL TABLE');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    COMMIT;
    EXCEPTION
    WHEN dup_val_on_index THEN
        DBMS_OUTPUT.PUT_LINE('This is duplicate value. Please enter a different value.');
    WHEN phno_char_exp THEN
        DBMS_OUTPUT.PUT_LINE('Invalid value. Phone number can only contain numbers');
    WHEN phno_exp THEN
        DBMS_OUTPUT.PUT_LINE('Invalid value. Phone number can only be 10 digits');
    WHEN zip_exp THEN
        DBMS_OUTPUT.PUT_LINE('Invalid value. Zipcode can only be 5 digits');
    WHEN INVALID_STATE THEN
        DBMS_OUTPUT.PUT_LINE('Our hotel services are available only in 3 states: MA, CA, NY');
    WHEN INVALID_CITY THEN
        DBMS_OUTPUT.PUT_LINE('Please enter a valid city for this state');
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('There was an error while inserting data into HOTEL table');
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error details:');
    DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
END INSERT_HOTEL;

------------------------------------------------RESERVATION BOOKINGS INSERT----------------------------------------------------------------------------
PROCEDURE INSERT_RESERVATION(Customer_Id IN NUMBER,Hotel_Id IN NUMBER,Room_Id IN NUMBER,Package_Id IN NUMBER,CheckIn_Date IN DATE,CheckOut_Date IN DATE,NumberOf_People IN NUMBER,NumberOf_Nights IN NUMBER)
AS
BEGIN
DECLARE
VSQL VARCHAR(500);
NO_OF_PEOPLE NUMBER;
ROOM_AVAIL CHAR(1);
PEOPLE_EXCEEDED EXCEPTION;
ROOM_BOOKED EXCEPTION;
BEGIN
    VSQL:='SELECT MAX_PERSONS FROM ROOM R1,ROOM_TYPE R2 WHERE r2.room_type_id=r1.room_type_id AND ROOM_ID='||Room_Id;
    EXECUTE IMMEDIATE VSQL INTO NO_OF_PEOPLE;
    IF NumberOf_People>NO_OF_PEOPLE THEN
    RAISE PEOPLE_EXCEEDED;
    END IF;
    VSQL:='SELECT ROOM_AVAILABILITY FROM ROOM WHERE ROOM_ID='||ROOM_ID;
    EXECUTE IMMEDIATE VSQL INTO ROOM_AVAIL;
    IF ROOM_AVAIL='N' THEN
    RAISE ROOM_BOOKED;
    END IF;
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    INSERT INTO RESERVATION(Customer_Id,Hotel_Id,Room_Id,Package_Id,CheckIn_Date,CheckOut_Date,NumberOf_People,NumberOf_Nights,Confirmation_Status) 
    VALUES(Customer_Id,Hotel_Id,Room_Id,Package_Id,CheckIn_Date,CheckOut_Date,NumberOf_People,NumberOf_Nights,'Booked');
    DBMS_OUTPUT.PUT_LINE('ROWS INSERTED INTO RESERVATION TABLE');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    COMMIT;
    EXCEPTION
    WHEN dup_val_on_index THEN
        DBMS_OUTPUT.PUT_LINE('This is duplicate value. Please enter a different value.');
    WHEN PEOPLE_EXCEEDED THEN
        DBMS_OUTPUT.PUT_LINE('Too many people');
    WHEN ROOM_BOOKED THEN
        DBMS_OUTPUT.PUT_LINE('Room already booked');
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('There was an error while inserting data into RESERVATION table');
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error details:');
    DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
END;
END INSERT_RESERVATION;


------------------------------------------------EMPLOYEE_INFO INSERT----------------------------------------------------------------------------
PROCEDURE INSERT_EMPLOYEE_INFO(
hotel_id in number,employee_fname in VARCHAR,employee_lname in VARCHAR,employee_DOB in date,employee_gender in char,employee_addressLine1 in VARCHAR,employee_city in VARCHAR,employee_state in VARCHAR,employee_zipCode in VARCHAR,employee_email in VARCHAR,employee_phone in VARCHAR,employee_designation in VARCHAR,employee_salary in number,employee_ID_type in VARCHAR,employee_ID_number in number)
AS
phonenum_exp EXCEPTION;
zipcode_exp EXCEPTION;
phno_char_exp EXCEPTION;
DESIGNATION EXCEPTION;
AGE EXCEPTION;
BEGIN
    IF VALIDATE_CONVERSION(employee_phone AS NUMBER)=0 THEN
        RAISE phno_char_exp;
    END IF;
    IF LENGTH(TRIM(employee_phone))<>10 THEN
        RAISE phonenum_exp;
    END IF;
    IF LENGTH(TRIM(employee_zipCode))<>5 THEN
        RAISE zipcode_exp;
    END IF;
    IF UPPER(employee_designation) NOT IN ('STAFF', 'RECEPTIONIST', 'MANAGER', 'ADMIN') THEN
    RAISE DESIGNATION;
    END IF;
    IF (SYSDATE-EMPLOYEE_DOB)/365 < 21 THEN
    RAISE AGE;
    END IF;
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    INSERT INTO Employee_Info(hotel_id,employee_fname,employee_lname,employee_DOB,employee_gender,employee_addressLine1,employee_city,employee_state,employee_zipCode,employee_email,employee_phone,employee_designation,employee_salary,employee_ID_type,employee_ID_number)
    values(hotel_id,employee_fname,employee_lname,employee_DOB,employee_gender,employee_addressLine1,employee_city,employee_state,employee_zipCode,employee_email,employee_phone,employee_designation,employee_salary,employee_ID_type,employee_ID_number);
    DBMS_OUTPUT.PUT_LINE('ROWS INSERTED INTO EMPLOYEE_INFO TABLE');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
    WHEN dup_val_on_index THEN
        DBMS_OUTPUT.PUT_LINE('This is duplicate value. Please enter a different value.');
    WHEN phno_char_exp THEN
        DBMS_OUTPUT.PUT_LINE('Invalid value. Phone number can only contain numbers');
    WHEN phonenum_exp THEN
        DBMS_OUTPUT.PUT_LINE('Invalid value. Phone number can only be 10 digits');
    WHEN zipcode_exp THEN
        DBMS_OUTPUT.PUT_LINE('Invalid value. Zipcode can only be 5 digits');
    WHEN DESIGNATION THEN
        DBMS_OUTPUT.PUT_LINE('Invalid Designation');
    WHEN AGE THEN
        DBMS_OUTPUT.PUT_LINE('Employee is below 21 years');
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('There was an error while inserting data into EMPLOYEE_INFO table');
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error details:');
    DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
END INSERT_EMPLOYEE_INFO;

---------------------------FEEDBACK INSERT------------------------------------------------------------------------------------------------------------------------------
PROCEDURE INSERT_FEEDBACK(booking_ID in NUMBER, feedback in VARCHAR)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO FEEDBACK(booking_ID, feedback) VALUES (booking_ID, feedback); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in FEEDBACK Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into FEEDBACK Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_FEEDBACK;


---------------------------ROOM INSERT------------------------------------------------------------------------------------------------------------------------------
PROCEDURE INSERT_ROOM(hotel_ID in NUMBER, room_type_ID in NUMBER, room_number in VARCHAR, room_availability in VARCHAR)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO ROOM(hotel_ID, room_type_ID, room_number, room_availability) VALUES (hotel_ID, room_type_ID, room_number, room_availability); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in ROOM Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into ROOM Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_ROOM;

---------------------------ROOM_TYPE INSERT------------------------------------------------------------------------------------------------------------------------------
PROCEDURE INSERT_ROOM_TYPE(room_type in VARCHAR, room_cost in NUMBER, max_persons in NUMBER)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO ROOM_TYPE(room_type, room_cost, max_persons) VALUES (room_type, room_cost, max_persons); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in ROOM_TYPE Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into ROOM_TYPE Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_ROOM_TYPE;

----------------------INVOICE INSERT-----------------------------------------
PROCEDURE INSERT_INVOICE(booking_ID1 IN NUMBER, payment_Method IN VARCHAR)
AS
BEGIN
DECLARE
PAYMENT_METHOD VARCHAR(20);
VSQL VARCHAR(50);
TOTAL_AMOUNT NUMBER;
ISMEMBER CHAR(1);
BEGIN
VSQL:='SELECT ROOM_COST*r.numberof_nights FROM RESERVATION R,ROOM R1,ROOM_TYPE R2 WHERE R.ROOM_ID=R1.ROOM_ID AND R1.ROOM_TYPE_ID=R2.ROOM_TYPE_ID AND UPPER(CONFIRMATION_STATUS)=''BOOKING'' AND BOOKING_ID='||booking_ID1;
EXECUTE IMMEDIATE VSQL INTO TOTAL_AMOUNT;
vsql:='SELECT CUSTOMER_ISMEMBER FROM CUSTOMER_INFO WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM RESERVATION WHERE BOOKING_ID='||booking_ID1||')';
EXECUTE IMMEDIATE VSQL INTO ISMEMBER;
PAYMENT_METHOD:=payment_Method;
IF ISMEMBER ='N' THEN
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    INSERT INTO INVOICE(booking_ID,reservation_Amount,additional_Services_Amount,total_bill_Amount,payment_Method) 
    SELECT R.BOOKING_ID,BASE_CHARGE,TOTAL_AMOUNT+SUM(NVL(ADDITIONAL_COST,0)),BASE_CHARGE+SUM(NVL(ADDITIONAL_COST,0)),payment_Method
    FROM HOTEL H INNER JOIN RESERVATION R ON H.HOTEL_ID=R.HOTEL_ID LEFT JOIN additional_services_availed A ON a.booking_id=r.booking_id 
    WHERE R.BOOKING_ID=booking_ID1 GROUP BY R.BOOKING_ID,BASE_CHARGE;
    DBMS_OUTPUT.PUT_LINE('ROWS INSERTED INTO INVOICE TABLE');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    COMMIT;
ELSE
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    INSERT INTO INVOICE(booking_ID,reservation_Amount,additional_Services_Amount,total_bill_Amount,payment_Method) 
    SELECT R.BOOKING_ID,BASE_CHARGE,TOTAL_AMOUNT*0.15+SUM(NVL(ADDITIONAL_COST,0)),BASE_CHARGE+SUM(NVL(ADDITIONAL_COST,0)),payment_Method
    FROM HOTEL H INNER JOIN RESERVATION R ON H.HOTEL_ID=R.HOTEL_ID LEFT JOIN additional_services_availed A ON a.booking_id=r.booking_id 
    WHERE R.BOOKING_ID=booking_ID1 GROUP BY R.BOOKING_ID,BASE_CHARGE;
    DBMS_OUTPUT.PUT_LINE('ROWS INSERTED INTO INVOICE TABLE');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    COMMIT;
END IF;
    EXCEPTION
    WHEN dup_val_on_index THEN
        DBMS_OUTPUT.PUT_LINE('This is duplicate value. Please enter a different value.');
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('There was an error while inserting data into INVOICE table');
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error details:');
    DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
END;
END INSERT_INVOICE;


-----------------CANCELLATION INSERT-------------------------------------------------------
PROCEDURE INSERT_CANCELLATION(booking_ID IN NUMBER,reason IN VARCHAR,cancellation_Date IN DATE)
AS
BEGIN
DECLARE
VSQL VARCHAR(500);
CHECKIN DATE;
BEGIN
    VSQL:='SELECT checkin_date FROM RESERVATION WHERE booking_id='||booking_id;
    execute immediate vsql into checkin;
    IF cancellation_Date>CHECKIN THEN
    DBMS_OUTPUT.PUT_LINE('Too late to cancel');
    ELSE
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    INSERT INTO CANCELLATION(booking_ID,reason,cancellation_Date) 
    VALUES(booking_ID,reason,cancellation_Date);
    DBMS_OUTPUT.PUT_LINE('ROWS INSERTED INTO CANCELLATION TABLE');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    COMMIT;
    END IF;
    EXCEPTION
    WHEN dup_val_on_index THEN
        DBMS_OUTPUT.PUT_LINE('This is duplicate value. Please enter a different value.');
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('There was an error while inserting data into CANCELLATION table');
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error details:');
    DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
END;
END INSERT_CANCELLATION;

PROCEDURE INSERT_ADDITIONAL_SERVICES_AVAILED (ROOM_SERVICE_ID IN NUMBER, BOOKING_ID IN NUMBER)
AS
BEGIN
DECLARE
VSQL VARCHAR(500);
CONFIRMATION_STATUS VARCHAR(20);
CANCELLED EXCEPTION;
BEGIN
    VSQL:='SELECT UPPER(CONFIRMATION_STATUS) FROM RESERVATION';
    EXECUTE IMMEDIATE VSQL INTO CONFIRMATION_STATUS;
    IF CONFIRMATION_STATUS='BOOKED' THEN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO ADDITIONAL_SERVICES_AVAILED(ROOM_SERVICE_ID, BOOKING_ID,ADDITIONAL_COST)
        SELECT ROOM_SERVICE_ID, BOOKING_ID,ROOM_SERVICE_COST FROM ROOM_SERVICE WHERE ROOM_SERVICE_ID=ROOM_SERVICE_ID;
        DBMS_OUTPUT.PUT_LINE('Rows inserted in ADDITIONAL_SERVICES Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
    ELSE
    RAISE CANCELLED;
    END IF;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
WHEN CANCELLED THEN
dbms_output.put_line('Booking no longer available');
when others then
dbms_output.put_line('Error while inserting data into ADDITIONAL_SERVICES_AVAILED Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
END;
end INSERT_ADDITIONAL_SERVICES_AVAILED;


PROCEDURE INSERT_ROOM_SERVICES (ROOM_SERVICE_DESCRIPTION IN VARCHAR, ROOM_SERVICE_COST IN NUMBER, HOTEL_ID IN NUMBER)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO ROOM_SERVICE(ROOM_SERVICE_DESCRIPTION, ROOM_SERVICE_COST,HOTEL_ID) VALUES (ROOM_SERVICE_DESCRIPTION,ROOM_SERVICE_COST, HOTEL_ID); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in ROOM_SERVICE Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into ROOM_SERVICE Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_ROOM_SERVICES;

END;
