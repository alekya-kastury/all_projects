--HOTEL table
EXECUTE INSERT_TABLES.INSERT_HOTEL('Seaport Hotel','1 Seaport Lane','Boston','MA','02210','8574449712','2 restaurants, an indoor pool, and a health club are available at this smoke-free hotel.',230);
EXECUTE INSERT_TABLES.INSERT_HOTEL('Revere Hotel','200 Stuart Street','Boston','MA','02116','6171324577','Along with a restaurant, this smoke-free hotel has 2 bars and a 24-hour fitness center.',199);
EXECUTE INSERT_TABLES.INSERT_HOTEL('Harborside Inn','185State Street','Boston','MA','02109','8576654901','Along with a restaurant, this smoke-free hotel has a bar and a coffee shop. Free WiFi.',119);
EXECUTE INSERT_TABLES.INSERT_HOTEL('Sheraton Hotel','39 Dalton Street','New York','NY','10101','8578891024','An indoor pool, a 24-hour fitness center, and a bar are available at this smoke-free hotel.',339);
EXECUTE INSERT_TABLES.INSERT_HOTEL('Ace Hotel','20 West 29th Street','New York','NY','10001','6079821783','2 bars, a 24-hour fitness center, and 2 coffee shops are available at this smoke-free hotel.',229);
EXECUTE INSERT_TABLES.INSERT_HOTEL('Washington Hotel','103 Waverly Street','New York','NY','10011','6071112786','Along with a restaurant, this smoke-free hotel has 2 bars and a health club.',299);
EXECUTE INSERT_TABLES.INSERT_HOTEL('Sonesta','1820 Barber Ln','Los Angeles','CA','95035','4087651877','Along with an outdoor pool, this smoke-free hotel has a restaurant and a 24-hour fitness center. ',199);
EXECUTE INSERT_TABLES.INSERT_HOTEL('Doubletree','39900 Balenine Dr','San Deigo','CA','94560','4081299301','Along with an outdoor pool, this smoke-free hotel has a restaurant and a 24-hour fitness center.',209);
EXECUTE INSERT_TABLES.INSERT_HOTEL('Hyatt Regency','5 Ember Center','San Francisco','CA','94111','4159901239','Along with a restaurant, this smoke free hotel has a 24 hour fitness center and a bar.',299);

--EMPLOYEE_INFO table
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(1,'Luckas'  , 'Smith'  , '18-APR-80', 'M', '321 Jackson Square'    , 'Boston'         , 'Massachusetts', '02130', 'luckas@gmail.com'  , '8572501754' ,'Receptionist', 24000, 'SSN'            , 234567891);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(1,'Jacob'   , 'Johnson', '20-JUN-85', 'M', '213 Jamaica Plain'     , 'Boston'         , 'Massachusetts', '02139', 'jacob@gmail.com'   , '8572101596' ,'Manager'     , 35000, 'Driving License', 299988801);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(1,'Henry'   , 'William', '27-AUG-90', 'M', '3193 Down Town'        , 'Boston'         , 'Massachusetts', '02129', 'henry@gmail.com'   , '8571239218' ,'Staff'       , 20000, 'SSN'            , 114567892);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(2,'Ethan'   , 'Brown'  , '06-JAN-91', 'M', '8550 Clark Lane'       , 'Brooklyn'       , 'Newyork'      , '10472', 'ethan@gmail.com'   , '6466473829' ,'Receptionist', 25000, 'SSN'            , 324567893);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(2,'Daniel'  , 'Jones'  , '19-MAR-98', 'M', '7790 James Drive'      , 'Albany'         , 'Newyork'      , '10977', 'daniel@gmail.com'  , '6463829287' ,'Manager'     , 36000, 'Driving License', 777711102);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(2,'Joseph'  , 'Garcia' , '11-MAR-81', 'M', '136 Cooper Street'     , 'Newyork'        , 'Newyork'      , '11237', 'joseph@gmail.com'  , '6462928715' ,'Staff'       , 21000, 'SSN'            , 344567894);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(3,'Henry'   , 'Miller' , '13-SEP-82', 'M', '4740 Reed Road'        , 'Upper Arlington', 'Ohio'         , '43220', 'henry1@gmail.com'  , '4194532912' ,'Receptionist', 26000, 'SSN'            , 454567895);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(3,'Ava'     , 'Davis'  , '06-JAN-99', 'F', '2124 North High Street', 'Columbus'       , 'Ohio'         , '43201', 'ava@gmail.com'     , '4194546753' ,'Manager'     , 37000, 'Driving License', 366622203);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(3,'Sophia'  , 'Lopez'  , '03-MAY-84', 'F', '7791 Cox Lane'         , 'West Chester'   , 'Ohio'         , '45069', 'sophia@gmail.com'  , '4198493287' ,'Staff'       , 22000, 'SSN'            , 674567896);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(4,'Mia'     , 'Johnson', '11-FEB-81', 'F', '1703 Ponerang'         , 'Las Angels'     , 'California'   , '92069', 'mia@gmail.com'     , '3104561290' ,'Receptionist', 27000, 'SSN'            , 784567897);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(4,'Isabella', 'White'  , '13-MAR-82', 'F', '591 grand avenue'      , 'Riverside'      , 'California'   , '95678', 'isabella@gmail.com', '3103126122' ,'Manager'     , 38000, 'Driving License', 233366607);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(4,'Liam'    , 'Taylor' , '09-APR-83', 'M', '6193 Sunrise Blvde'    , 'Sacramento'     , 'California'   , '92110', 'liam@gmail.com'    , '3102561270' ,'Staff'       , 23000, 'SSN'            , 894567898);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(5,'Naoh'    , 'Thomas' , '06-JAN-99', 'M', '2405 Centerville RD'   , 'Springfield'    , 'Virginia'     , '20171', 'naoh@gmail.com'    , '2068575309' ,'Receptionist', 28000, 'SSN'            , 904567890);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(5,'Olliver' , 'Wilson' , '18-JUN-81', 'M', '7511 Leesburg'         , 'Reston'         , 'Virginia'     , '20190', 'olliver@gmail.com' , '2061238541' ,'Manager'     , 39000, 'Driving License', 122255505);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(5,'William' , 'Lee'    , '18-JUL-80', 'M', '2035 Bond St'          , 'Herndon'        , 'Virginia'     , '20151', 'william@gmail.com' , '2062347652' ,'Staff'       , 24000, 'SSN'            , 914567892);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(6,'Jimmy'    , 'Obrien' , '06-JAN-99', 'M', '2405 Centerville RD'   , 'Springfield'    , 'Virginia'     , '20171', 'jimmy@gmail.com'    , '2068575309' ,'Receptionist', 28000, 'SSN'            , 904567890);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(6,'Anthony' , 'Rees' , '18-JUN-81', 'M', '7511 Leesburg'         , 'Reston'         , 'Virginia'     , '20190', 'anthony@gmail.com' , '2061238541' ,'Manager'     , 39000, 'Driving License', 122255505);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(6,'Josh' , 'Mathews'    , '18-JUL-80', 'M', '2035 Bond St'          , 'Herndon'        , 'Virginia'     , '20151', 'joshMathews@gmail.com' , '2062347652' ,'Staff'       , 24000, 'SSN'            , 914567892);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(7,'Tyler'    , 'Bates' , '06-JAN-99', 'M', '2405 Centerville RD'   , 'Springfield'    , 'Virginia'     , '20171', 'tyler@gmail.com'    , '2068575309' ,'Receptionist', 28000, 'SSN'            , 904567890);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(7,'Alfie' , 'Jones' , '18-JUN-81', 'M', '7511 Leesburg'         , 'Reston'         , 'Virginia'     , '20190', 'alfie@gmail.com' , '2061238541' ,'Manager'     , 39000, 'Driving License', 122255505);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(7,'Jessie' , 'Mckay'    , '18-JUL-80', 'M', '2035 Bond St'          , 'Herndon'        , 'Virginia'     , '20151', 'jessie@gmail.com' , '2062347652' ,'Staff'       , 24000, 'SSN'            , 914567892);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(8,'Mark'    , 'Barret' , '06-JAN-99', 'M', '2405 Centerville RD'   , 'Springfield'    , 'Virginia'     , '20171', 'mark@gmail.com'    , '2068575309' ,'Receptionist', 28000, 'SSN'            , 904567890);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(8,'Howard' , 'Powell' , '18-JUN-81', 'M', '7511 Leesburg'         , 'Reston'         , 'Virginia'     , '20190', 'howard@gmail.com' , '2061238541' ,'Manager'     , 39000, 'Driving License', 122255505);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(8,'Camillo' , 'Middletown'    , '18-JUL-80', 'M', '2035 Bond St'          , 'Herndon'        , 'Virginia'     , '20151', 'camillo@gmail.com' , '2062347652' ,'Staff'       , 24000, 'SSN'            , 914567892);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(9,'norah'    , 'Jones' , '06-JAN-99', 'M', '2405 Centerville RD'   , 'Springfield'    , 'Virginia'     , '20171', 'norah@gmail.com'    , '2068575309' ,'Receptionist', 28000, 'SSN'            , 904567890);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(9,'Callum' , 'Wilson' , '18-JUN-81', 'M', '7511 Leesburg'         , 'Reston'         , 'Virginia'     , '20190', 'callum@gmail.com' , '2061238541' ,'Manager'     , 39000, 'Driving License', 122255505);
execute INSERT_TABLES.INSERT_EMPLOYEE_INFO(9,'Max' , 'Lee'    , '18-JUL-80', 'M', '2035 Bond St'          , 'Herndon'        , 'Virginia'     , '20151', 'max@gmail.com' , '2062347652' ,'Staff'       , 24000, 'SSN'            , 914567892);
---ROOM_TYPE table
---Here the assumption is that each room can have an extra bed. The max_person column is updated based on this logic
execute INSERT_TABLES.INSERT_ROOM_TYPE('Single',75,2);
execute INSERT_TABLES.INSERT_ROOM_TYPE('Double',100,3);
execute INSERT_TABLES.INSERT_ROOM_TYPE('Triple',140,4);
execute INSERT_TABLES.INSERT_ROOM_TYPE('Quad',180,5);

--ROOM TABLE
------SINGLE ROOMS AVAILABLE IN HOTEL WITH ID 1
execute INSERT_TABLES.INSERT_ROOM(1,2100,'A101','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2100,'A102','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2100,'A103','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2100,'A104','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2100,'A105','Y');

-------DOUBLE ROOMS IN HOTEL WITH ID 1
execute INSERT_TABLES.INSERT_ROOM(1,2101,'B101','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2101,'B102','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2101,'B103','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2101,'B104','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2101,'B105','Y');

-------TRIPLE ROOMS IN HOTEL WITH ID 1
execute INSERT_TABLES.INSERT_ROOM(1,2102,'C101','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2102,'C102','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2102,'C103','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2102,'C104','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2102,'C105','Y');

-------QUAD ROOMS IN HOTEL WITH ID 1
execute INSERT_TABLES.INSERT_ROOM(1,2103,'D101','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2103,'D102','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2103,'D103','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2103,'D104','Y');
execute INSERT_TABLES.INSERT_ROOM(1,2103,'D105','Y');

------SINGLE ROOMS AVAILABLE IN HOTEL WITH ID 2
execute INSERT_TABLES.INSERT_ROOM(2,2100,'A101','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2100,'A102','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2100,'A103','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2100,'A104','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2100,'A105','Y');

-------DOUBLE ROOMS IN HOTEL WITH ID 2
execute INSERT_TABLES.INSERT_ROOM(2,2101,'B101','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2101,'B102','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2101,'B103','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2101,'B104','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2101,'B105','Y');

-------TRIPLE ROOMS IN HOTEL WITH ID 2
execute INSERT_TABLES.INSERT_ROOM(2,2102,'C101','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2102,'C102','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2102,'C103','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2102,'C104','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2102,'C105','Y');

-------QUAD ROOMS IN HOTEL WITH ID 2
execute INSERT_TABLES.INSERT_ROOM(2,2103,'D101','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2103,'D102','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2103,'D103','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2103,'D104','Y');
execute INSERT_TABLES.INSERT_ROOM(2,2103,'D105','Y');

------SINGLE ROOMS AVAILABLE IN HOTEL WITH ID 3
execute INSERT_TABLES.INSERT_ROOM(3,2100,'A101','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2100,'A102','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2100,'A103','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2100,'A104','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2100,'A105','Y');

-------DOUBLE ROOMS IN HOTEL WITH ID 3
execute INSERT_TABLES.INSERT_ROOM(3,2101,'B101','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2101,'B102','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2101,'B103','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2101,'B104','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2101,'B105','Y');

-------TRIPLE ROOMS IN HOTEL WITH ID 3
execute INSERT_TABLES.INSERT_ROOM(3,2102,'C101','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2102,'C102','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2102,'C103','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2102,'C104','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2102,'C105','Y');

-------QUAD ROOMS IN HOTEL WITH ID 3
execute INSERT_TABLES.INSERT_ROOM(3,2103,'D101','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2103,'D102','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2103,'D103','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2103,'D104','Y');
execute INSERT_TABLES.INSERT_ROOM(3,2103,'D105','Y');

------SINGLE ROOMS AVAILABLE IN HOTEL WITH ID 4
execute INSERT_TABLES.INSERT_ROOM(4,2100,'A101','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2100,'A102','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2100,'A103','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2100,'A104','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2100,'A105','Y');

-------DOUBLE ROOMS IN HOTEL WITH ID 4
execute INSERT_TABLES.INSERT_ROOM(4,2101,'B101','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2101,'B102','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2101,'B103','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2101,'B104','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2101,'B105','Y');

-------TRIPLE ROOMS IN HOTEL WITH ID 4
execute INSERT_TABLES.INSERT_ROOM(4,2102,'C101','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2102,'C102','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2102,'C103','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2102,'C104','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2102,'C105','Y');

-------QUAD ROOMS IN HOTEL WITH ID 4
execute INSERT_TABLES.INSERT_ROOM(4,2103,'D101','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2103,'D102','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2103,'D103','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2103,'D104','Y');
execute INSERT_TABLES.INSERT_ROOM(4,2103,'D105','Y');

------SINGLE ROOMS AVAILABLE IN HOTEL WITH ID 5
execute INSERT_TABLES.INSERT_ROOM(5,2100,'A101','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2100,'A102','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2100,'A103','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2100,'A104','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2100,'A105','Y');

-------DOUBLE ROOMS IN HOTEL WITH ID 5
execute INSERT_TABLES.INSERT_ROOM(5,2101,'B101','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2101,'B102','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2101,'B103','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2101,'B104','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2101,'B105','Y');

-------TRIPLE ROOMS IN HOTEL WITH ID 5
execute INSERT_TABLES.INSERT_ROOM(5,2102,'C101','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2102,'C102','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2102,'C103','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2102,'C104','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2102,'C105','Y');

-------QUAD ROOMS IN HOTEL WITH ID 5
execute INSERT_TABLES.INSERT_ROOM(5,2103,'D101','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2103,'D102','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2103,'D103','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2103,'D104','Y');
execute INSERT_TABLES.INSERT_ROOM(5,2103,'D105','Y');

------SINGLE ROOMS AVAILABLE IN HOTEL WITH ID 6
execute INSERT_TABLES.INSERT_ROOM(6,2100,'A101','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2100,'A102','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2100,'A103','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2100,'A104','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2100,'A105','Y');

-------DOUBLE ROOMS IN HOTEL WITH ID 6
execute INSERT_TABLES.INSERT_ROOM(6,2101,'B101','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2101,'B102','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2101,'B103','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2101,'B104','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2101,'B105','Y');

-------TRIPLE ROOMS IN HOTEL WITH ID 6
execute INSERT_TABLES.INSERT_ROOM(6,2102,'C101','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2102,'C102','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2102,'C103','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2102,'C104','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2102,'C105','Y');

-------QUAD ROOMS IN HOTEL WITH ID 6
execute INSERT_TABLES.INSERT_ROOM(6,2103,'D101','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2103,'D102','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2103,'D103','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2103,'D104','Y');
execute INSERT_TABLES.INSERT_ROOM(6,2103,'D105','Y');

------SINGLE ROOMS AVAILABLE IN HOTEL WITH ID 7
execute INSERT_TABLES.INSERT_ROOM(7,2100,'A101','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2100,'A102','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2100,'A103','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2100,'A104','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2100,'A105','Y');

-------DOUBLE ROOMS IN HOTEL WITH ID 7
execute INSERT_TABLES.INSERT_ROOM(7,2101,'B101','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2101,'B102','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2101,'B103','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2101,'B104','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2101,'B105','Y');

-------TRIPLE ROOMS IN HOTEL WITH ID 7
execute INSERT_TABLES.INSERT_ROOM(7,2102,'C101','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2102,'C102','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2102,'C103','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2102,'C104','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2102,'C105','Y');

-------QUAD ROOMS IN HOTEL WITH ID 7
execute INSERT_TABLES.INSERT_ROOM(7,2103,'D101','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2103,'D102','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2103,'D103','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2103,'D104','Y');
execute INSERT_TABLES.INSERT_ROOM(7,2103,'D105','Y');

------SINGLE ROOMS AVAILABLE IN HOTEL WITH ID 8
execute INSERT_TABLES.INSERT_ROOM(8,2100,'A101','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2100,'A102','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2100,'A103','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2100,'A104','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2100,'A105','Y');

-------DOUBLE ROOMS IN HOTEL WITH ID 8
execute INSERT_TABLES.INSERT_ROOM(8,2101,'B101','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2101,'B102','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2101,'B103','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2101,'B104','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2101,'B105','Y');

-------TRIPLE ROOMS IN HOTEL WITH ID 8
execute INSERT_TABLES.INSERT_ROOM(8,2102,'C101','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2102,'C102','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2102,'C103','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2102,'C104','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2102,'C105','Y');

-------QUAD ROOMS IN HOTEL WITH ID 8
execute INSERT_TABLES.INSERT_ROOM(8,2103,'D101','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2103,'D102','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2103,'D103','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2103,'D104','Y');
execute INSERT_TABLES.INSERT_ROOM(8,2103,'D105','Y');

------SINGLE ROOMS AVAILABLE IN HOTEL WITH ID 9
execute INSERT_TABLES.INSERT_ROOM(9,2100,'A101','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2100,'A102','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2100,'A103','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2100,'A104','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2100,'A105','Y');

-------DOUBLE ROOMS IN HOTEL WITH ID 9
execute INSERT_TABLES.INSERT_ROOM(9,2101,'B101','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2101,'B102','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2101,'B103','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2101,'B104','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2101,'B105','Y');

-------TRIPLE ROOMS IN HOTEL WITH ID 9
execute INSERT_TABLES.INSERT_ROOM(9,2102,'C101','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2102,'C102','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2102,'C103','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2102,'C104','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2102,'C105','Y');

-------QUAD ROOMS IN HOTEL WITH ID 9
execute INSERT_TABLES.INSERT_ROOM(9,2103,'D101','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2103,'D102','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2103,'D103','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2103,'D104','Y');
execute INSERT_TABLES.INSERT_ROOM(9,2103,'D105','Y');

--------------------ROOM_SERVICES----------------------------------------------
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Cleaning',50, 1);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Food',50, 1);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Dry Cleaning',20, 1);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Breakfast',40, 1);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Cleaning',50, 2);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Food',50, 2);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Dry Cleaning',20, 2);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Breakfast',40, 2);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Cleaning',50, 3);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Food',50, 3);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Dry Cleaning',20, 3);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Breakfast',40, 3);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Cleaning',50, 4);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Food',50, 4);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Dry Cleaning',20, 4);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Breakfast',40, 4);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Cleaning',50, 5);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Food',50, 5);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Dry Cleaning',20, 5);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Breakfast',40, 5);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Cleaning',50, 6);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Food',50, 6);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Dry Cleaning',20, 6);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Breakfast',40, 6);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Cleaning',50, 7);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Food',50, 7);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Dry Cleaning',20, 7);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Breakfast',40, 7);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Cleaning',50, 8);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Food',50, 8);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Dry Cleaning',20, 8);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Breakfast',40, 8);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Cleaning',50, 9);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Food',50, 9);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Dry Cleaning',20, 9);
exec INSERT_TABLES.INSERT_ROOM_SERVICES ('Breakfast',40, 9);

-- PACKAGE_DEALS table
execute INSERT_TABLES.INSERT_PACKAGE_DEALS('Bus Tour', 20);
execute INSERT_TABLES.INSERT_PACKAGE_DEALS('Trekking', 10);

COMMIT;

