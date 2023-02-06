--Creating hotel_manager role
create user hotel_manager identified by Hotelmanager1;

GRANT CONNECT, RESOURCE TO hotel_manager;
GRANT CREATE SESSION TO hotel_manager;
GRANT SELECT ON ROOM TO hotel_manager;
GRANT SELECT ON ROOM_TYPE TO hotel_manager;
GRANT SELECT ON EMPLOYEE_INFO TO hotel_manager;
GRANT SELECT ON FEEDBACK TO hotel_manager;

GRANT INSERT,UPDATE ON CUSTOMER_INFO to hotel_manager;
GRANT INSERT,UPDATE ON ADDITIONAL_SERVICES_AVAILED to hotel_manager;
GRANT INSERT,UPDATE ON INVOICE to hotel_manager;
GRANT INSERT,UPDATE ON RESERVATION to hotel_manager;
GRANT INSERT,UPDATE ON EMPLOYEE_INFO to hotel_manager;
GRANT INSERT,UPDATE ON ROOM_SERVICE to hotel_manager;
GRANT INSERT,UPDATE ON PACKAGE_DEALS to hotel_manager;

--Creating receiptionist role
create user receiptionist identified by Hotelreceiption1;

GRANT CONNECT, RESOURCE TO receiptionist;
GRANT CREATE SESSION TO receiptionist;
GRANT SELECT ON ROOM TO receiptionist;
GRANT SELECT ON ROOM_TYPE TO receiptionist;
GRANT SELECT ON ROOM_SERVICE TO receiptionist;
GRANT SELECT ON PACKAGE_DEALS TO receiptionist;

GRANT INSERT,UPDATE ON CUSTOMER_INFO to receiptionist;
GRANT INSERT,UPDATE ON ADDITIONAL_SERVICES_AVAILED to receiptionist;
GRANT INSERT,UPDATE ON CANCELLATION to receiptionist;
GRANT INSERT,UPDATE ON INVOICE to receiptionist;
GRANT INSERT,UPDATE ON RESERVATION to receiptionist;

--Creating hotel_staff role
create user hotel_staff identified by Hotelstaffrole1;

GRANT CONNECT, RESOURCE TO hotel_staff;
GRANT CREATE SESSION TO hotel_staff;

GRANT SELECT ON ROOM TO hotel_staff;
GRANT SELECT ON ROOM_TYPE TO hotel_staff;
GRANT SELECT ON ROOM_SERVICE TO hotel_staff;

GRANT UPDATE ON ADDITIONAL_SERVICES_AVAILED to hotel_staff;

--Creating customer role
create user customer identified by Testhoteluser1;

GRANT CONNECT, RESOURCE TO customer;
GRANT CREATE SESSION TO customer;

GRANT SELECT ON HOTEL TO customer;
GRANT SELECT ON ROOM TO customer;
GRANT SELECT ON ROOM_TYPE TO customer;
GRANT SELECT ON ROOM_SERVICE TO customer;
GRANT SELECT ON PACKAGE_DEALS TO customer;
GRANT SELECT ON INVOICE TO customer;

GRANT INSERT,UPDATE ON RESERVATION to customer;
GRANT INSERT,UPDATE ON CANCELLATION to customer;
GRANT INSERT,UPDATE ON ADDITIONAL_SERVICES_AVAILED to customer;