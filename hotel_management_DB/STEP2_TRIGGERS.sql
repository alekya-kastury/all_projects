CREATE OR REPLACE TRIGGER TOTAL_ROOMS_TRG 
AFTER INSERT OR UPDATE ON ROOM
BEGIN
    FOR my_row IN (
        SELECT hotel_id FROM hotel) LOOP
        UPDATE hotel
        SET TOTAL_ROOMS = (SELECT COUNT(ROOM_ID) FROM ROOM WHERE HOTEL_ID=MY_ROW.HOTEL_ID)
        WHERE HOTEL_ID=MY_ROW.HOTEL_ID;
    END LOOP;
    FOR my_row IN (
        SELECT hotel_id FROM hotel) LOOP
        UPDATE hotel
        SET
            rooms_available = (
                SELECT COUNT(room_id) FROM ROOM WHERE hotel_id = my_row.hotel_id AND room_availability = 'Y'),
            rooms_unavailable = (
                SELECT COUNT(room_id) FROM ROOM WHERE hotel_id = my_row.hotel_id AND room_availability = 'N')
        WHERE hotel_id = my_row.hotel_id;
END LOOP;
END;
/

CREATE OR REPLACE TRIGGER CANCELLATION_TRG 
AFTER INSERT OR UPDATE ON CANCELLATION
declare 
vsql varchar(500);
BEGIN
vsql:='update reservation SET CONFIRMATION_STATUS=''CANCELLED'' WHERE BOOKING_ID IN (SELECT BOOKING_ID FROM CANCELLATION)';
execute immediate vsql;
vsql:='update room SET room_availability=''Y'' WHERE ROOM_ID IN (SELECT ROOM_ID FROM RESERVATION WHERE UPPER(CONFIRMATION_STATUS)=''CANCELLED'')';
execute immediate vsql;
    FOR my_row IN (
        SELECT hotel_id FROM hotel) LOOP
        UPDATE hotel
        SET
            rooms_available = (
                SELECT COUNT(room_id) FROM ROOM WHERE hotel_id = my_row.hotel_id AND room_availability = 'Y'),
            rooms_unavailable = (
                SELECT COUNT(room_id) FROM ROOM WHERE hotel_id = my_row.hotel_id AND room_availability = 'N')
        WHERE hotel_id = my_row.hotel_id;
END LOOP;
END;
/

CREATE OR REPLACE TRIGGER ROOM_TRG 
AFTER INSERT OR UPDATE ON RESERVATION
declare 
vsql varchar(500);
BEGIN
vsql:='update ROOM SET ROOM_AVAILABILITY=''N'' WHERE ROOM_ID IN (SELECT ROOM_ID FROM RESERVATION)';
execute immediate vsql;
    FOR my_row IN (
        SELECT hotel_id FROM hotel) LOOP
        UPDATE hotel
        SET
            rooms_available = (
                SELECT COUNT(room_id) FROM ROOM WHERE hotel_id = my_row.hotel_id AND room_availability = 'Y'),
            rooms_unavailable = (
                SELECT COUNT(room_id) FROM ROOM WHERE hotel_id = my_row.hotel_id AND room_availability = 'N')
        WHERE hotel_id = my_row.hotel_id;
END LOOP;
END;
/



CREATE OR REPLACE TRIGGER INVOICE_TOTAL_TRG 
AFTER INSERT OR UPDATE ON PACKAGE_dEALS
declare 
vsql varchar(500);
BEGIN
vsql:='merge into INVOICE I 
USING (SELECT * FROM RESERVATION R INNER JOIN package_deals P ON r.package_id=p.package_id)H
ON (I.BOOKING_ID=H.BOOKING_ID)
WHEN MATCHED THEN UPDATE SET
I.TOTAL_BILL_AMOUNT=I.RESERVATION_AMOUNT+ADDITIONAL_SERVICES_AMOUNT+H.PACKAGE_COST';
execute immediate vsql;
END;
/


CREATE OR REPLACE TRIGGER CHANGE_AVAILABILITY_TRG 
AFTER INSERT ON INVOICE
BEGIN
UPDATE ROOM SET ROOM_AVAILABILITY='Y' WHERE room_id IN (SELECT ROOM_ID FROM RESERVATION WHERE CHECKOUT_DATE<SYSDATE);
    FOR my_row IN (
        SELECT hotel_id FROM hotel) LOOP
        UPDATE hotel
        SET
            rooms_available = (
                SELECT COUNT(room_id) FROM ROOM WHERE hotel_id = my_row.hotel_id AND room_availability = 'Y'),
            rooms_unavailable = (
                SELECT COUNT(room_id) FROM ROOM WHERE hotel_id = my_row.hotel_id AND room_availability = 'N')
        WHERE hotel_id = my_row.hotel_id;
END LOOP;
END;
/

