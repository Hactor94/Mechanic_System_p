INSERT INTO client_booking VALUES (10, 'Sunnyside', '155 Troye Street', 'Toyota', 2017, 'Pretoria', 'mkhonkosi28@gmail.com', 'Tholinhlanhla', 215777308,'Hlophe', 'Not starting engine', 'Yaris', 0728108800, 'Engine Maintenance', 'yes', 'South Africa', 0002);
INSERT INTO client_booking VALUES (11, 'Ivy Park', '6 Prince Street', 'BMW', 2019, 'Pret', 'tgramashala@gmail.com', 'Thapelo', 215777308,'Ramashala', 'Faulty Gearbox', 'X4', 0728043265, 'Air Condition Services', 'yes', 'South Africa', 1125);
INSERT INTO client_booking VALUES (12, 'Soshanguve', '3862 malibongwe street', 'Mercedes-Benz', 2014, 'Pretoria', 'moimakatlego2@gmail.com', 'Katlego', 215000524,'Moima', 'New Radiator', 'AMG', 0797794520, 'Wheel Alignment', 'yes', 'South Africa', 0102);
INSERT INTO client_booking VALUES (13, 'Sunnyside', '6397 Phola Park', 'Volkswagen', 2018, 'Piet Retief', 'sbunkosi@gmail.com', 'Sbusiso', 218202096,'Nkosi', 'Not starting engine', 'Polo R', 0716363184, 'Replacement', 'yes', 'South Africa', 2380);
INSERT INTO client_booking VALUES (14, 'Sunnyside', '144 Mayo Street', 'Audi', 2018, 'Johannesburg', 'khumalovp@gmail.com', 'Vusi', 218202095,'Khumalo', 'Not starting engine', 'A3', 0637778547, 'Engine Maintenance', 'yes', 'South Africa', 0002);
INSERT INTO client_booking VALUES (15, 'Sunnyside', '170 Troye Drive', 'Mazda', 2016, 'Piet Retief', 'mikekhumalo@gmail.com', 'Mike', 215777308,'Khumalo', 'Not starting engine', 'Mazda 3', 0613232458, 'Transmission Repair', 'yes', 'South Africa', 2380);

INSERT INTO Mechanic VALUES (217450985, 1, '1994/11/11', 'mkhonkosi@gmail.com', 'Hactor', 'Male', 'Hlophe', 'nhlanhla', 'ADMIN, MECHANIC', 0728108800, 'ADMIN, MECHANIC', 'yes');
INSERT INTO Mechanic VALUES (215000524, 1, '1996/01/25', 'tgramashala@gmail.com', 'Thapelo', 'Male', 'Ramashala', 'thapelo', 'ADMIN, MECHANIC', 0729698264, 'ADMIN, MECHANIC', 'yes');
INSERT INTO Mechanic VALUES (215000527, 1, '1994/11/11', 'moimakatlego2@gmail.com', 'Katlego', 'Female', 'Moima', 'Ivy', 'ADMIN, MECHANIC', 0728108800, 'ADMIN, MECHANIC', 'yes');
INSERT INTO Mechanic VALUES (215778922, 1, '1996/01/25', 'tgramashala@gmail.com', 'Thapelo', 'Male', 'Ramashala', 'thapelo', 'ADMIN, MECHANIC', 0729698264, 'ADMIN, MECHANIC', 'yes');
INSERT INTO Mechanic VALUES (215779708, 1, '1994/11/11', 'mkhonkosi@gmail.com', 'Hactor', 'Male', 'Hlophe', 'nhlanhla', 'ADMIN, MECHANIC', 0728108800, 'ADMIN, MECHANIC', 'yes');
INSERT INTO Mechanic VALUES (217897144, 1, '1996/01/25', 'tgramashala@gmail.com', 'Thapelo', 'Male', 'Ramashala', 'thapelo', 'ADMIN, MECHANIC', 0729698264, 'ADMIN, MECHANIC', 'yes');

INSERT INTO insurance_company VALUES (218202091, 1,'155 Troye Street', 'Trio123', 'Pretoria', 'Matatazela','South Africa', 'info@matatazela.com', 'nhlanhla', 'INSURANCE', 0112520660, 'INSURANCE', 'yes', 0002);
INSERT INTO insurance_company VALUES (218202092, 1,'6 Prince street', 'Thap123', 'Pretoria', 'Insu Car','South Africa', 'info@insucar.com', 'thapelo', 'INSURANCE', 0112520600, 'INSURANCE', 'yes', 0002);
INSERT INTO insurance_company VALUES (218202093, 1,'404 Pretrious', 'pre123', 'Pretoria', 'Dialletcar','South Africa', 'info@dailletcar.com', 'katlego', 'INSURANCE', 0112529660, 'INSURANCE', 'yes', 0002);
INSERT INTO insurance_company VALUES (218202094, 1,'155 Troye Street', 'Trio123', 'Pretoria', 'Matatazela','South Africa', 'info@matatazela.com', 'nhlanhla', 'INSURANCE', 0112520660, 'INSURANCE', 'yes', 0002);
INSERT INTO insurance_company VALUES (218202095, 1,'153 Celliers Street', 'Moloro99', 'Pretoria', 'Malepe','South Africa', 'info@malepe.com', 'Moloro', 'INSURANCE', 0112520660, 'INSURANCE', 'yes', 0002);
INSERT INTO insurance_company VALUES (218202096, 1,'155 Troye Street', 'Trio123', 'Pretoria', 'Matatazela','South Africa', 'info@matatazela.com', 'nhlanhla', 'INSURANCE', 0112520660, 'INSURANCE', 'yes', 0002);

INSERT INTO car VALUES (10, 'New Car', '', 00.00, 10, 218202091, null);
INSERT INTO car VALUES (11, 'New Car', '', 3500.00, 11, 218202092, null);
INSERT INTO car VALUES (12, 'New Car', '', 2000.00, 12, 218202093, null);
INSERT INTO car VALUES (13, 'New Car', '', 1500.00, 13, 218202094, null);
INSERT INTO car VALUES (14, 'New Car', '', 500.00, 14, 218202095, null);
INSERT INTO car VALUES (15, 'New Car', '', 3500.00, 15, 218202096, null);
INSERT INTO car VALUES (16, 'New Car', '', 500.00, 15, 215667308, null);

INSERT INTO service VALUES (2020, 3500.00, 'Engine Maintenance');
INSERT INTO service VALUES (2021, 1500.00, 'Wheel Alignment');
INSERT INTO service VALUES (2022, 2000, 'Air Condition Services');
INSERT INTO service VALUES (2023, 500, 'Transmission Repair And Replacement');

INSERT INTO service_mechanic VALUES (2020, 215000524); 
INSERT INTO service_mechanic VALUES (2021, 215667308);
INSERT INTO service_mechanic VALUES (2022, 215778922);
INSERT INTO service_mechanic VALUES (2023, 215779708);
INSERT INTO service_mechanic VALUES (2020, 217450985);
INSERT INTO service_mechanic VALUES (2021, 217897144);
INSERT INTO service_mechanic VALUES (2022, 215000524);
INSERT INTO service_mechanic VALUES (2023, 215667308);

INSERT INTO payment VALUES (10, 01/04/2019, 8000); 
INSERT INTO payment VALUES (11, 01/04/2019, 1000); 
INSERT INTO payment VALUES (12, 01/04/2019, 4000); 
INSERT INTO payment VALUES (13, 01/04/2019, 7500); 
INSERT INTO payment VALUES (14, 01/04/2019, 9000); 
INSERT INTO payment VALUES (15, 01/04/2019, 6000);

select * from mechanic;
select * from insurance_company;
select * from client_booking;
select * from car;
select * from service;
select * from payment;
select * from service_mechanic;

desc car;

SELECT b.fname, b.lname, b.email, b.phone, b.brand, b.model, b.car_year, b.service_type, c.car_status, c.total_cost, c.booking_booking_id, c.insurance_reg_number, c.mechanic_stuff_number  
FROM car c, client_booking b 
WHERE b.booking_id = c.booking_booking_id
AND c.car_id = 16; 

SELECT *
FROM client_booking b LEFT JOIN car c 
ON b.booking_id = c.booking_booking_id
WHERE c.car_id = 16;

SELECT b.fname, b.lname, b.email, b.phone, b.brand, b.model, b.car_year, b.service_type, c.car_status, c.total_cost, c.booking_booking_id, c.insurance_reg_number, c.mechanic_stuff_number FROM car c, client_booking WHERE b.booking_id = c.booking_booking_id AND c.car_id = 16;