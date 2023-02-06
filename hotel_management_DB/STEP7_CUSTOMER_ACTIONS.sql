set serveroutput on;

CREATE OR REPLACE PROCEDURE CHOOSE_HOTEL(HOTEL_ID1 IN NUMBER)
AS
BEGIN
IF HOTEL_ID1<1 OR HOTEL_ID1>9 THEN
dbms_output.put_line('Invalid Hotel ID');
ELSE
dbms_output.put_line('');
dbms_output.put_line('*********************************************************************************************');
dbms_output.put_line('Hotel chosen: '||HOTEL_ID1);
dbms_output.put_line('**********************************************************************************************');
dbms_output.put_line('Rooms Available');
FOR MY_ROW in  (SELECT DISTINCT R.ROOM_ID,R.ROOM_NUMBER, T.ROOM_TYPE, T.ROOM_COST, t.max_persons FROM admin.ROOM R INNER JOIN admin.room_type T ON r.room_type_id=t.room_type_id WHERE R.HOTEL_ID=HOTEL_ID1 and r.room_availability='Y') 
LOOP
dbms_output.put_line('ROOM ID: '||MY_ROW.ROOM_ID);
dbms_output.put_line('ROOM NUMBER: '||MY_ROW.ROOM_NUMBER);
dbms_output.put_line('ROOM TYPE: '||MY_ROW.ROOM_TYPE);
dbms_output.put_line('ROOM COST: '||MY_ROW.ROOM_COST);
dbms_output.put_line('MAX PEOPLE: '||MY_ROW.max_persons);
dbms_output.put_line('');
END LOOP;
dbms_output.put_line('*********************************************************************************************');
dbms_output.put_line('ROOM SERVICES AVAILABLE');
dbms_output.put_line('**********************************************************************************************');
FOR MY_ROW in  (SELECT ROOM_SERVICE_ID, ROOM_SERVICE_DESCRIPTION, ROOM_SERVICE_COST FROM admin.ROOM_SERVICE R WHERE R.HOTEL_ID=HOTEL_ID1) 
LOOP
dbms_output.put_line('ROOM SERVICE ID: '||MY_ROW.ROOM_SERVICE_ID);
dbms_output.put_line('ROOM SERVICE DESCRIPTION: '||MY_ROW.ROOM_SERVICE_DESCRIPTION);
dbms_output.put_line('ROOM COST: '||MY_ROW.ROOM_SERVICE_COST);
dbms_output.put_line('');
END LOOP;
dbms_output.put_line('*********************************************************************************************');
dbms_output.put_line('PACKAGE DEALS');
dbms_output.put_line('**********************************************************************************************');
FOR MY_ROW IN (SELECT PACKAGE_ID, PACKAGE_DESCRIPTION, PACKAGE_COST FROM admin.PACKAGE_DEALS) LOOP
dbms_output.put_line('');
dbms_output.put_line('PACKAGE ID: '||MY_ROW.PACKAGE_ID);
dbms_output.put_line('PACKAGE DESCRIPTION: '||MY_ROW.PACKAGE_DESCRIPTION);
dbms_output.put_line('PACKAGE COST: '||MY_ROW.PACKAGE_COST);
dbms_output.put_line('');
END LOOP;
dbms_output.put_line('*********************************************************************************************');
dbms_output.put_line('To book this hotel run the below command after filling in  the details');
dbms_output.put_line('');
dbms_output.put_line('EXECUTE BOOKING('||HOTEL_ID1||',CUSTOMER ID, ROOM ID, PACKAGE ID, CHECK IN DATE, CHECK OUT DATE, NUMBER OF PEOPLE, NUMBER OF NIGHTS);');
dbms_output.put_line('*********************************************************************************************');
END IF;
END CHOOSE_HOTEL;
/

CREATE OR REPLACE PROCEDURE BOOKING(CUSTOMER_ID IN NUMBER, HOTEL_ID IN NUMBER, ROOM_ID IN NUMBER, PACKAGE_ID IN NUMBER, CHECKIN_DATE IN DATE, CHECKOUT_DATE IN DATE, NUMBEROF_PEOPLE IN NUMBER, NUMBEROF_NIGHTS IN NUMBER)
AS
BEGIN
declare 
booking_id NUMBER;
VSQL VARCHAR(500);
BEGIN
IF CHECKIN_DATE<SYSDATE OR CHECKOUT_DATE<SYSDATE THEN
dbms_output.put_line('Please enter a future date');
ELSIF CHECKIN_DATE>CHECKOUT_DATE THEN
dbms_output.put_line('Check in date is greater than check out date');
ELSIF ROOM_ID<700 OR ROOM_ID>879 THEN
dbms_output.put_line('Invalid room ID');
ELSIF PACKAGE_ID<400 OR PACKAGE_ID>401 THEN
dbms_output.put_line('Invalid Package ID');
ELSE
INSERT INTO RESERVATION (HOTEL_ID, CUSTOMER_ID, ROOM_ID, PACKAGE_ID, CHECKIN_DATE, CHECKOUT_DATE, NUMBEROF_PEOPLE, NUMBEROF_NIGHTS, CONFIRMATION_STATUS) 
VALUES (CUSTOMER_ID, HOTEL_ID, ROOM_ID, PACKAGE_ID, CHECKIN_DATE, CHECKOUT_DATE, NUMBEROF_PEOPLE, NUMBEROF_NIGHTS,'Booked');
VSQL:='SELECT MAX(BOOKING_ID) FROM RESERVATION';
EXECUTE IMMEDIATE VSQL INTO BOOKING_ID;
dbms_output.put_line('*********************************************************************************************');
dbms_output.put_line('ROOM SUCCESSFULLY BOOKED');
dbms_output.put_line('');
dbms_output.put_line('Your Booking ID: '||BOOKING_ID);
dbms_output.put_line('To generate invoice execute the below command');
dbms_output.put_line('EXEC GENERATE_INVOICE('||BOOKING_ID||',PAYMENT_METHOD)');
dbms_output.put_line('**********************************************************************************************');
END IF;
END;
END;
/
CREATE OR REPLACE PROCEDURE ROOM_SERVICES(BOOKING_ID1 IN NUMBER,ROOM_SERVICE_ID1 IN NUMBER)
AS
BEGIN
DECLARE
VSQL VARCHAR(500);
ADDITIONAL_COST1 NUMBER;
CONFIRMATION_STATUS1 VARCHAR(20);
CANCELLED EXCEPTION;
BEGIN
VSQL:='SELECT CONFIRMATION_STATUS FROM RESERVATION WHERE BOOKING_ID='||BOOKING_ID1;
EXECUTE IMMEDIATE VSQL INTO CONFIRMATION_STATUS1;
IF upper(CONFIRMATION_STATUS1)='CANCELLED' THEN
dbms_output.put_line('This booking ID is cancelled');
ELSIF ROOM_SERVICE_ID1<1200 OR ROOM_SERVICE_ID1>1235 THEN
dbms_output.put_line('Invalid Room service ID');
ELSE
VSQL:='SELECT ROOM_SERVICE_COST FROM ROOM_SERVICE R WHERE ROOM_SERVICE_ID='||room_service_id1||'';
EXECUTE IMMEDIATE VSQL INTO ADDITIONAL_COST1;
INSERT INTO additional_services_availed (ROOM_SERVICE_ID, BOOKING_ID, ADDITIONAL_COST) VALUES (ROOM_SERVICE_ID1,BOOKING_ID1,ADDITIONAL_COST1);
COMMIT;
END IF;
END;
END;
/

create or replace procedure GENERATE_INVOICE(BOOKING_ID1 IN NUMBER,PAYMENT_METHOD1 IN VARCHAR)
AS
BEGIN
DELETE FROM INVOICE WHERE booking_id=BOOKING_ID1;
INSERT INTO INVOICE (BOOKING_ID,RESERVATION_AMOUNT,ADDITIONAL_SERVICES_AMOUNT, TOTAL_BILL_AMOUNT,PAYMENT_METHOD)
select 
R.BOOKING_ID,
BASE_CHARGE,
SUM(NVL(ADDITIONAL_COST,0)),
BASE_CHARGE+SUM(NVL(ADDITIONAL_COST,0)),
PAYMENT_METHOD1
from reservation R LEFT JOIN additional_Services_Availed A 
ON r.booking_id=a.booking_id INNER JOIN HOTEL H 
ON R.HOTEL_ID=H.HOTEL_ID WHERE R.BOOKING_ID=BOOKING_ID1 GROUP BY R.BOOKING_ID,BASE_CHARGE;
dbms_output.put_line('*********************************************************************************************');
dbms_output.put_line('INVOICE');
dbms_output.put_line('**********************************************************************************************');
for my_row in (select INVOICE_ID, BOOKING_ID, RESERVATION_AMOUNT, ADDITIONAL_SERVICES_AMOUNT, TOTAL_BILL_AMOUNT, PAYMENT_METHOD from INVOICE WHERE BOOKING_ID=BOOKING_ID1)
loop
dbms_output.put_line('INVOICE ID: '||MY_ROW.INVOICE_ID);
dbms_output.put_line('BOOKING ID: '||MY_ROW.BOOKING_ID);
dbms_output.put_line('BASE CHARGE: '||MY_ROW.RESERVATION_AMOUNT);
dbms_output.put_line('ADDITIONAL SERVICES: '||MY_ROW.ADDITIONAL_SERVICES_AMOUNT);
dbms_output.put_line('TOTAL BILL AMOUNT: '||MY_ROW.TOTAL_BILL_AMOUNT);
dbms_output.put_line('PAYMENT METHOD: '||MY_ROW.PAYMENT_METHOD);
END LOOP;
END;
/

create or replace procedure VIEW_INVOICE(BOOKING_ID1 IN NUMBER)
AS
BEGIN
dbms_output.put_line('*********************************************************************************************');
dbms_output.put_line('INVOICE');
dbms_output.put_line('**********************************************************************************************');
for my_row in (select INVOICE_ID, BOOKING_ID, RESERVATION_AMOUNT, ADDITIONAL_SERVICES_AMOUNT, TOTAL_BILL_AMOUNT, PAYMENT_METHOD from INVOICE WHERE BOOKING_ID=BOOKING_ID1)
loop
dbms_output.put_line('INVOICE ID: '||MY_ROW.INVOICE_ID);
dbms_output.put_line('BOOKING ID: '||MY_ROW.BOOKING_ID);
dbms_output.put_line('BASE CHARGE: '||MY_ROW.RESERVATION_AMOUNT);
dbms_output.put_line('ADDITIONAL SERVICES: '||MY_ROW.ADDITIONAL_SERVICES_AMOUNT);
dbms_output.put_line('TOTAL BILL AMOUNT: '||MY_ROW.TOTAL_BILL_AMOUNT);
dbms_output.put_line('PAYMENT METHOD: '||MY_ROW.PAYMENT_METHOD);
END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE signup(customer_fname VARCHAR, customer_lname VARCHAR, customer_gender CHAR, customer_addressLine1 VARCHAR, customer_city VARCHAR, customer_state VARCHAR, customer_zipCode VARCHAR, customer_email VARCHAR, customer_phone VARCHAR, customer_isMember CHAR, customer_ID_proof VARCHAR, customer_numberOfVisits NUMBER)
IS
nCount NUMBER;
customer_id number;
vsql varchar(500);
BEGIN
SELECT count(*) into nCount FROM all_users where customer_email = UPPER(customer_email);
IF(nCount > 0)
THEN
dbms_output.put_line('User already exists..');
ELSIF LENGTH(customer_phone)>10 THEN
dbms_output.put_line('Invalid Phone number');
ELSE 
INSERT INTO CUSTOMER_INFO(CUSTOMER_FNAME,
CUSTOMER_LNAME,
CUSTOMER_GENDER,
CUSTOMER_ADDRESSLINE1,
CUSTOMER_CITY,
CUSTOMER_STATE,
CUSTOMER_ZIPCODE,
CUSTOMER_EMAIL,
CUSTOMER_PHONE,
CUSTOMER_ISMEMBER,
CUSTOMER_ID_PROOF,
CUSTOMER_NUMBEROFVISITS) VALUES(customer_fname,
customer_lname,
customer_gender,
customer_addressLine1,
customer_city ,
customer_state ,
customer_zipCode ,
customer_email ,
customer_phone ,
customer_isMember ,
customer_ID_proof ,
customer_numberOfVisits );
vsql:='SELECT MAX(CUSTOMER_ID) FROM CUSTOMER_INFO';
EXECUTE IMMEDIATE VSQL INTO customer_id;
DBMS_OUTPUT.PUT_LINE('Your Customer ID is '||customer_id);
EXECUTE IMMEDIATE'CREATE USER '||customer_fname||' IDENTIFIED BY Dmddprojectuser'||customer_id;
EXECUTE IMMEDIATE'GRANT CONNECT, RESOURCE TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT CREATE SESSION TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT ON admin.HOTEL TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT ON admin.ROOM TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT ON admin.ROOM_TYPE TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT ON admin.ROOM_SERVICE TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT ON admin.PACKAGE_DEALS TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT,UPDATE,INSERT ON admin.RESERVATION TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT,UPDATE,INSERT ON admin.ADDITIONAL_SERVICES_AVAILED TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT,UPDATE,INSERT ON admin.INVOICE TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT,UPDATE,INSERT ON admin.CANCELLATION TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT,UPDATE,INSERT ON admin.FEEDBACK TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT SELECT,UPDATE,INSERT ON admin.CUSTOMER_INFO TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT EXECUTE ON admin.CHOOSE_HOTEL TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT EXECUTE ON admin.BOOKING TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT EXECUTE ON admin.room_services TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT EXECUTE ON admin.GENERATE_INVOICE TO '||customer_fname;
EXECUTE IMMEDIATE'GRANT EXECUTE ON admin.insert_tables TO '||customer_fname;
END IF;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into CUSTOMER_INFO Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
END;
/
