INSERT INTO client_booking VALUES (10, 'Sunnyside', '155 Troye Street', 'Toyota', 2017, 'Pretoria', 'mkhonkosi28@gmail.com', 'Tholinhlanhla', 215777308,'Hlophe', 'Not starting engine', 'Yaris', '0728108800', 'Engine Maintenance', 'yes', 'South Africa', 0002);
INSERT INTO client_booking VALUES (11, 'Ivy Park', '6 Prince Street', 'BMW', 2019, 'Polokwane', 'tgramashala@gmail.com', 'Thapelo', 215777308,'Ramashala', 'Faulty Gearbox', 'X4', '0728043265', 'Air Condition Services', 'yes', 'South Africa', 0700);
INSERT INTO client_booking VALUES (12, 'Soshanguve', '3862 malibongwe street', 'Mercedes-Benz', 2014, 'Pretoria', 'moimakatlego2@gmail.com', 'Katlego', 215000524,'Moima', 'New Radiator', 'AMG', '0797794520', 'Wheel Alignment', 'yes', 'South Africa', 0102);
INSERT INTO client_booking VALUES (13, 'Sunnyside', '6397 Phola Park', 'Volkswagen', 2018, 'Piet Retief', 'sbunkosi@gmail.com', 'Sbusiso', 218202096,'Nkosi', 'Not starting engine', 'Polo R', '0716363184', 'Replacement', 'yes', 'South Africa', 2380);
INSERT INTO client_booking VALUES (14, 'Sunnyside', '144 Mayo Street', 'Audi', 2018, 'Johannesburg', 'khumalovp@gmail.com', 'Vusi', 218202095,'Khumalo', 'Not starting engine', 'A3', '0637778547', 'Engine Maintenance', 'yes', 'South Africa', 0002);
INSERT INTO client_booking VALUES (15, 'Sunnyside', '170 Troye Drive', 'Mazda', 2016, 'Piet Retief', 'mikekhumalo@gmail.com', 'Mike', 215777308,'Khumalo', 'Not starting engine', 'Mazda 3', '0613232458', 'Transmission Repair', 'yes', 'South Africa', 2380);

INSERT INTO Mechanic VALUES (217450985, 1, '1994/11/11', 'mkhonkosi45@gmail.com', 'Hactor', 'Male', 'Hlophe', 'nhlanhla', 'ADMIN, MECHANIC', 0728108803, 'ADMIN, MECHANIC', 'yes');
INSERT INTO Mechanic VALUES (215000524, 1, '1996/01/25', 'tgramashala87@gmail.com', 'Thapelo', 'Male', 'Ramashala', 'thapelo', 'ADMIN, MECHANIC', 0729698263, 'ADMIN, MECHANIC', 'yes');
INSERT INTO Mechanic VALUES (215000527, 1, '1994/11/11', 'moimakatlego20@gmail.com', 'Katlego', 'Female', 'Moima', 'Ivy', 'ADMIN, MECHANIC', 0728108800, 'ADMIN, MECHANIC', 'yes');
INSERT INTO Mechanic VALUES (215778922, 1, '1996/01/25', 'tgramashala90@gmail.com', 'Thapelo', 'Male', 'Ramashala', 'thapelo', 'ADMIN, MECHANIC', 0729698268, 'ADMIN, MECHANIC', 'yes');
INSERT INTO Mechanic VALUES (215779708, 1, '1994/11/11', 'mkhonkosi98@gmail.com', 'Hactor', 'Male', 'Hlophe', 'nhlanhla', 'ADMIN, MECHANIC', 0728108805, 'ADMIN, MECHANIC', 'yes');
INSERT INTO Mechanic VALUES (217897144, 1, '1996/01/25', '215667308@tut4life.ac.za', 'Thapelo', 'Male', 'Ramashala', 'thapelo', 'ADMIN, MECHANIC', 0729698267, 'ADMIN, MECHANIC', 'yes');

INSERT INTO insurance_company VALUES (218202091, 1,'155 Troye Street', 'Trio123', 'Pretoria', 'Matatazela','South Africa', 'info12@matatazela.com', 'nhlanhla', 'INSURANCE', 0112520660, 'INSURANCE', 'yes', 0002);
INSERT INTO insurance_company VALUES (218202092, 1,'6 Prince street', 'Thap123', 'Pretoria', 'Insu Car','South Africa', 'info90@insucar.com', 'thapelo', 'INSURANCE', 0112520601, 'INSURANCE', 'yes', 0002);
INSERT INTO insurance_company VALUES (218202093, 1,'404 Pretrious', 'pre123', 'Pretoria', 'Dialletcar','South Africa', 'info45@dailletcar.com', 'katlego', 'INSURANCE', 0112529664, 'INSURANCE', 'yes', 0002);
INSERT INTO insurance_company VALUES (218202094, 1,'155 Troye Street', 'Trio123', 'Pretoria', 'Matatazela','South Africa', 'info23@matatazela.com', 'nhlanhla', 'INSURANCE', 0112520668, 'INSURANCE', 'yes', 0002);
INSERT INTO insurance_company VALUES (218202095, 1,'153 Celliers Street', 'Moloro99', 'Pretoria', 'Malepe','South Africa', 'info65@malepe.com', 'Moloro', 'INSURANCE', 0112570660, 'INSURANCE', 'yes', 0002);
INSERT INTO insurance_company VALUES (218202096, 1,'155 Troye Street', 'Trio123', 'Pretoria', 'Matatazela','South Africa', 'info89@matatazela.com', 'nhlanhla', 'INSURANCE', 0112523669, 'INSURANCE', 'yes', 0002);

INSERT INTO car VALUES (10, 'New Car', '', '', 00.00, 10, 218202091, null);
INSERT INTO car VALUES (11, 'New Car', '', '', 3500.00, 11, 218202092, null);
INSERT INTO car VALUES (12, 'New Car', '', '', 2000.00, 12, 218202093, null);
INSERT INTO car VALUES (13, 'New Car', '', '', 1500.00, 13, 218202094, null);
INSERT INTO car VALUES (14, 'New Car', '', '', 500.00, 14, 218202095, null);
INSERT INTO car VALUES (15, 'New Car', '', '', 3500.00, 15, 218202096, null);
INSERT INTO car VALUES (16, 'New Car', '', '', 500.00, 15, 215667308, null);

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

INSERT INTO payment VALUES (10, 00-00-0000, 15); 
INSERT INTO payment VALUES (11, 00-00-0000, 14); 
INSERT INTO payment VALUES (12, 00-00-0000, 13); 
INSERT INTO payment VALUES (13, 00-00-0000, 12); 
INSERT INTO payment VALUES (14, 00-00-0000, 11); 
INSERT INTO payment VALUES (15, 00-00-0000, 10);

select * from mechanic;
select * from insurance_company;
select * from client_booking;
select * from car;
select * from service;
select * from payment;
select * from service_mechanic;

desc car;
desc client_booking;
desc mechanic;
