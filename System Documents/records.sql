INSERT INTO client_booking VALUES (10, 'Sunnyside', '155 Troye Street', 'Toyota', 2017, 'Pretoria', 'mkhonkosi28@gmail.com', 'Tholinhlanhla', 215784490,'Hlophe', 'Not starting engine', 'Yaris', '0728108800', 'Engine Maintenance', 'yes', 'South Africa', '0002');
INSERT INTO client_booking VALUES (11, 'Ivy Park', '6 Prince Street', 'BMW', 2019, 'Polokwane', 'tgramashala@gmail.com', 'Thapelo', 215784491,'Ramashala', 'Faulty Gearbox', 'X4', '0728043265', 'Air Condition Services', 'yes', 'South Africa', '0700');
INSERT INTO client_booking VALUES (12, 'Soshanguve', '3862 malibongwe street', 'Mercedes-Benz', 2014, 'Pretoria', 'moimakatlego2@gmail.com', 'Katlego', 215784492,'Moima', 'New Radiator', 'AMG', '0797794520', 'Wheel Alignment', 'yes', 'South Africa', '0102');
INSERT INTO client_booking VALUES (13, 'Sunnyside', '6397 Phola Park', 'Volkswagen', 2018, 'Piet Retief', 'sbunkosi@gmail.com', 'Sbusiso', 215784493,'Nkosi', 'Not starting engine', 'Polo R', '0716363184', 'Replacement', 'yes', 'South Africa', '2380');
INSERT INTO client_booking VALUES (14, 'Sunnyside', '144 Mayo Street', 'Audi', 2018, 'Johannesburg', 'khumalovp@gmail.com', 'Vusi', 215784494,'Khumalo', 'Not starting engine', 'A3', '0637778547', 'Engine Maintenance', 'yes', 'South Africa', '0002');
INSERT INTO client_booking VALUES (15, 'Sunnyside', '170 Troye Drive', 'Mazda', 2016, 'Piet Retief', 'mikekhumalo@gmail.com', 'Mike', 215784495,'Khumalo', 'Not starting engine', 'Mazda 3', '0613232458', 'Transmission Repair', 'yes', 'South Africa', '2380');
INSERT INTO client_booking VALUES (16, 'Fauna Park', '23 McDonalds Street', 'Nissan', 2018, ' Polokwane', 'matomeraphadu@gmail.com', 'Matome', 215784496,'Raphadu', 'Not starting engine', 'Qashqai', '0814615789', 'Transmission Repair', 'yes', 'South Africa', '0700');
INSERT INTO client_booking VALUES (17, 'Bendor Park', '172 Tsar Street', 'Toyata', 2018, ' Polokwane', 'katlegopeterSeakamela@gmail.com', 'Katlego', 215784497,'Seakamela', 'Gear Box', 'Rush', '0728763047', 'Gear box repair', 'yes', 'South Africa', '0700');
INSERT INTO client_booking VALUES (18, 'Acardia', '404 Pretorious', 'BMW', 2018, ' Pretoria', 'mtselepe@gmail.com', 'Martin', 215784498,'Selepe', 'Wheel Alignment', '3 Series', '0848403969', 'Wheel alignment repair', 'yes', 'South Africa', '0002');
INSERT INTO client_booking VALUES (19, 'Pretoria Central', '127 Visagie', 'Mazda', 2019, ' Pretoria', 'KaraboTshoke@gmail.com', 'Karabo', 215784499,'Tshoke', 'Air conditioner', 'mazda 2', '0814617685', 'Air conditioner Repair', 'yes', 'South Africa', '0002');

INSERT INTO car VALUES (10, 'New Car', null, null, 5535.61, 10, 215784490, null);
INSERT INTO car VALUES (11, 'New Car', null, null, 15505.92, 11, 215784491, null);
INSERT INTO car VALUES (12, 'New Car', null, null, 4651.78, 12, 215784492, null);
INSERT INTO car VALUES (13, 'New Car', null, null, 5535.61, 13, 215784493, null);
INSERT INTO car VALUES (14, 'New Car', null, null, 500.00, 14, 215784494, null);
INSERT INTO car VALUES (15, 'New Car', null, null, 4651.78, 15, 215784495, null);
INSERT INTO car VALUES (16, 'New Car', null, null, 500.00, 16, 215784496, null);
INSERT INTO car VALUES (17, 'New Car', null, null, 500.00, 17, 215784497, null);
INSERT INTO car VALUES (18, 'New Car', null, null, 4651.78, 18, 215784498, null);
INSERT INTO car VALUES (19, 'New Car', null, null, 5535.61, 19, 215784499, null);

INSERT INTO service_mechanic VALUES (2020, 215667308); 
INSERT INTO service_mechanic VALUES (2021, 215667308);
INSERT INTO service_mechanic VALUES (2022, 214612976);
INSERT INTO service_mechanic VALUES (2023, 214612976);
INSERT INTO service_mechanic VALUES (2020, 215000524);
INSERT INTO service_mechanic VALUES (2021, 215000524);
INSERT INTO service_mechanic VALUES (2022, 217450985);
INSERT INTO service_mechanic VALUES (2023, 217450985);
INSERT INTO service_mechanic VALUES (2020, 216770100); 
INSERT INTO service_mechanic VALUES (2021, 216770101);
INSERT INTO service_mechanic VALUES (2022, 216770102);
INSERT INTO service_mechanic VALUES (2023, 216770103);
INSERT INTO service_mechanic VALUES (2020, 216770104);
INSERT INTO service_mechanic VALUES (2021, 216770105);

INSERT INTO payment VALUES (10, '2020-01-23', 19); 
INSERT INTO payment VALUES (11, '2020-02-01', 18); 
INSERT INTO payment VALUES (12, '2020-05-11', 17); 
INSERT INTO payment VALUES (13, '2020-09-22', 16); 
INSERT INTO payment VALUES (14, '2020-09-12', 15); 
INSERT INTO payment VALUES (15, '2020-09-20', 14);
INSERT INTO payment VALUES (16, '2020-10-30', 13); 
INSERT INTO payment VALUES (17, '2020-11-14', 12); 
INSERT INTO payment VALUES (18, '2020-11-06', 11); 
INSERT INTO payment VALUES (19, '2020-11-03', 10);

select * from mechanic;
select * from insurance_company;
select * from client_booking;
select * from car;
select * from service;
select * from payment;
select * from service_mechanic; 

desc car;
desc client_booking;

select reg_number, company_name, roles, password from insurance_company;