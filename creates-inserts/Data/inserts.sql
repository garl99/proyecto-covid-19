/*-------------------------Ejecutar Directorios.sql-----------------------*/
/*-------------------------Ejecutar Secuencias.sql-----------------------*/
/*-------------------------Ejecutar Procedimientos.sql-----------------------*/


/*--------------------------------LUGARES---------------------------------*/

execute agregaImagen('IMAGE', 'usa.png', 'Estados Unidos', 'pais', 328000000);
execute agregaImagen('IMAGE', 'alemania.png', 'Alemania', 'pais', 83200000);
execute agregaImagen('IMAGE', 'brasil.jpg', 'Brasil', 'pais', 209000000);
execute agregaImagen('IMAGE', 'china.jpg', 'China', 'pais', 1393000000);
execute agregaImagen('IMAGE', 'espana.png', 'España', 'pais', 46940000);
execute agregaImagen('IMAGE', 'francia.png', 'Francia', 'pais', 66900000);
execute agregaImagen('IMAGE', 'reino.png', 'Reino Unido', 'pais', 66650000);
execute agregaImagen('IMAGE', 'italia.png',  'Italia', 'pais', 60360000);
execute agregaImagen('IMAGE', 'rusia.jpg', 'Rusia', 'pais', 144500000); 
execute agregaImagen('IMAGE', 'venezuela.png', 'Venezuela', 'pais', 28870000);

insert into Lugar values(sec_Lugar.nextVal, 'California', 'estado', 39510000, null,  Info_Cantidad (0,0,0,0,0,0), 6);
insert into Lugar values(sec_Lugar.nextVal, 'Texas', 'estado', 29000000, null,  Info_Cantidad (0,0,0,0,0,0), 6);
insert into Lugar values(sec_Lugar.nextVal, 'Florida', 'estado', 21480000, null,  Info_Cantidad (0,0,0,0,0,0), 6);
insert into Lugar values(sec_Lugar.nextVal, 'Arizona', 'estado', 7279000, null,  Info_Cantidad (0,0,0,0,0,0), 6);
insert into Lugar values(sec_Lugar.nextVal, 'Colorado', 'estado', 5759000, null,  Info_Cantidad (0,0,0,0,0,0), 6);

insert into Lugar values(sec_Lugar.nextVal, 'Berlin', 'estado', 3769000, null,  Info_Cantidad (0,0,0,0,0,0), 7);
insert into Lugar values(sec_Lugar.nextVal, 'Hamburgo', 'estado', 1899000, null,  Info_Cantidad (0,0,0,0,0,0), 7);
insert into Lugar values(sec_Lugar.nextVal, 'Munich', 'estado', 1472000, null,  Info_Cantidad (0,0,0,0,0,0), 7);
insert into Lugar values(sec_Lugar.nextVal, 'Colonia', 'estado', 1061000, null,  Info_Cantidad (0,0,0,0,0,0), 7);
insert into Lugar values(sec_Lugar.nextVal, 'Frankfurt', 'estado', 753056, null,  Info_Cantidad (0,0,0,0,0,0), 7);

insert into Lugar values(sec_Lugar.nextVal, 'Sao Paulo', 'estado', 41250000, null,  Info_Cantidad (0,0,0,0,0,0), 8);
insert into Lugar values(sec_Lugar.nextVal, 'Minas', 'estado', 21170000, null,  Info_Cantidad (0,0,0,0,0,0), 8);
insert into Lugar values(sec_Lugar.nextVal, 'Rio de Janeiro', 'estado', 17260000, null,  Info_Cantidad (0,0,0,0,0,0), 8);
insert into Lugar values(sec_Lugar.nextVal, 'Bahia', 'estado', 15150000, null,  Info_Cantidad (0,0,0,0,0,0), 8);
insert into Lugar values(sec_Lugar.nextVal, 'Rio Grande', 'estado', 11228000, null,  Info_Cantidad (0,0,0,0,0,0), 8);


insert into Lugar values(sec_Lugar.nextVal, 'Shanghai', 'estado', 24280000, null,  Info_Cantidad (0,0,0,0,0,0), 9);
insert into Lugar values(sec_Lugar.nextVal, 'Pekin', 'estado', 21710000, null,  Info_Cantidad (0,0,0,0,0,0), 9);
insert into Lugar values(sec_Lugar.nextVal, 'Canton', 'estado', 13995790, null,  Info_Cantidad (0,0,0,0,0,0), 9);
insert into Lugar values(sec_Lugar.nextVal, 'Shanzhen', 'estado', 17557170, null,  Info_Cantidad (0,0,0,0,0,0), 9);
insert into Lugar values(sec_Lugar.nextVal, 'Tianjin', 'estado', 19898560, null,  Info_Cantidad (0,0,0,0,0,0), 9);

insert into Lugar values(sec_Lugar.nextVal, 'Madrid', 'estado', 6685500, null,  Info_Cantidad (0,0,0,0,0,0), 10);
insert into Lugar values(sec_Lugar.nextVal, 'Barcelona', 'estado', 5664579, null,  Info_Cantidad (0,0,0,0,0,0), 10);
insert into Lugar values(sec_Lugar.nextVal, 'Valencia', 'estado', 2565120, null,  Info_Cantidad (0,0,0,0,0,0), 10);
insert into Lugar values(sec_Lugar.nextVal, 'Sevilla', 'estado', 1939890, null,  Info_Cantidad (0,0,0,0,0,0), 10);
insert into Lugar values(sec_Lugar.nextVal, 'Alicante', 'estado', 1858690, null,  Info_Cantidad (0,0,0,0,0,0), 10);

insert into Lugar values(sec_Lugar.nextVal, 'Paris', 'estado', 2148000, null,  Info_Cantidad (0,0,0,0,0,0), 11);
insert into Lugar values(sec_Lugar.nextVal, 'Marsella', 'estado', 855393, null,  Info_Cantidad (0,0,0,0,0,0), 11);
insert into Lugar values(sec_Lugar.nextVal, 'Lyon', 'estado', 500715, null,  Info_Cantidad (0,0,0,0,0,0), 11);
insert into Lugar values(sec_Lugar.nextVal, 'Toulouse', 'estado', 458298, null,  Info_Cantidad (0,0,0,0,0,0), 11);
insert into Lugar values(sec_Lugar.nextVal, 'Niza', 'estado', 342295, null,  Info_Cantidad (0,0,0,0,0,0), 11);

insert into Lugar values(sec_Lugar.nextVal, 'Londres', 'estado', 9248670, null,  Info_Cantidad (0,0,0,0,0,0), 12);
insert into Lugar values(sec_Lugar.nextVal, 'Birmingham', 'estado', 1157580, null,  Info_Cantidad (0,0,0,0,0,0), 12);
insert into Lugar values(sec_Lugar.nextVal, 'Glasgow', 'estado', 613050, null,  Info_Cantidad (0,0,0,0,0,0), 12);
insert into Lugar values(sec_Lugar.nextVal, 'Liverpool', 'estado', 488263, null,  Info_Cantidad (0,0,0,0,0,0), 12);
insert into Lugar values(sec_Lugar.nextVal, 'Leeds', 'estado', 798825, null,  Info_Cantidad (0,0,0,0,0,0), 12);

insert into Lugar values(sec_Lugar.nextVal, 'Roma', 'estado', 3458580, null,  Info_Cantidad (0,0,0,0,0,0), 13);
insert into Lugar values(sec_Lugar.nextVal, 'Milan', 'estado', 1550588, null,  Info_Cantidad (0,0,0,0,0,0), 13);
insert into Lugar values(sec_Lugar.nextVal, 'Napoles', 'estado', 1012034, null,  Info_Cantidad (0,0,0,0,0,0), 13);
insert into Lugar values(sec_Lugar.nextVal, 'Turin', 'estado', 947653, null,  Info_Cantidad (0,0,0,0,0,0), 13);
insert into Lugar values(sec_Lugar.nextVal, 'Palermo', 'estado', 722374, null,  Info_Cantidad (0,0,0,0,0,0), 13);

insert into Lugar values(sec_Lugar.nextVal, 'Moscu', 'estado', 11500000, null,  Info_Cantidad (0,0,0,0,0,0), 14);
insert into Lugar values(sec_Lugar.nextVal, 'San Petesburgo', 'estado', 5523780, null,  Info_Cantidad (0,0,0,0,0,0), 14);
insert into Lugar values(sec_Lugar.nextVal, 'Novosibirsk', 'estado', 1766331, null,  Info_Cantidad (0,0,0,0,0,0), 14);
insert into Lugar values(sec_Lugar.nextVal, 'Ekaterinburgo', 'estado', 1510000, null,  Info_Cantidad (0,0,0,0,0,0), 14);
insert into Lugar values(sec_Lugar.nextVal, 'Samara', 'estado', 1178999, null,  Info_Cantidad (0,0,0,0,0,0), 14);

insert into Lugar values(sec_Lugar.nextVal, 'Distrito Capital', 'estado', 4946956, null,  Info_Cantidad (0,0,0,0,0,0), 15);
insert into Lugar values(sec_Lugar.nextVal, 'Zulia', 'estado', 4280715, null,  Info_Cantidad (0,0,0,0,0,0), 15);
insert into Lugar values(sec_Lugar.nextVal, 'Miranda', 'estado', 3218038, null,  Info_Cantidad (0,0,0,0,0,0), 15);
insert into Lugar values(sec_Lugar.nextVal, 'Lara', 'estado', 2219211, null,  Info_Cantidad (0,0,0,0,0,0), 15);
insert into Lugar values(sec_Lugar.nextVal, 'Carabobo', 'estado', 2538085, null,  Info_Cantidad (0,0,0,0,0,0), 15);


/*Patologías*/

INSERT INTO Patologia (id, nombre)
VALUES (sec_Patologia.nextval, 'Diabetes');
INSERT INTO Patologia (id, nombre)
VALUES(sec_Patologia.nextval, 'Cáncer');
INSERT INTO Patologia (id, nombre)
VALUES(sec_Patologia.nextval, 'Hipertensión');
INSERT INTO Patologia (id, nombre)
VALUES (sec_Patologia.nextval, 'Asma');
INSERT INTO Patologia (id, nombre)
VALUES(sec_Patologia.nextval, 'Alzheimer');
INSERT INTO Patologia (id, nombre)
VALUES(sec_Patologia.nextval, 'SIDA');
INSERT INTO Patologia (id, nombre)
VALUES(sec_Patologia.nextval, 'Lupus');
INSERT INTO Patologia (id, nombre)
VALUES (sec_Patologia.nextval, 'Poliomielitis');
INSERT INTO Patologia (id, nombre)
VALUES(sec_Patologia.nextval, 'Gripe');
INSERT INTO Patologia (id, nombre)
VALUES(sec_Patologia.nextval, 'Alzheimer');
INSERT INTO Patologia (id, nombre)
VALUES(sec_Patologia.nextval, 'Anemia');
INSERT INTO Patologia (id, nombre)
VALUES (sec_Patologia.nextval, 'Dengue');
INSERT INTO Patologia (id, nombre)
VALUES (sec_Patologia.nextval, 'Amigdalitis');
INSERT INTO Patologia (id, nombre)
VALUES(sec_Patologia.nextval, 'Sarampión');
INSERT INTO Patologia (id, nombre)
VALUES (sec_Patologia.nextval, 'Varicela');
INSERT INTO Patologia (id, nombre)
VALUES (sec_Patologia.nextval, 'Infección Urinaria');
       
/*Sintomas*/
       
INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Fiebre');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Tos seca');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Cansancio');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Molestia y dolores');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Dolor de garganta');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Diarrea');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Conjuntivitis');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Dolor de cabeza');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Pérdida del gusto');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Erupciones cutáneas');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Dolor de cabeza');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Dificultad para respirar');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Dolor en el pecho');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Incapacidad para moverse');
        INSERT INTO Sintoma (id, nombre)
VALUES (sec_Sintoma.nextval, 'Incapacidad para hablar');
        
/*Insumos*/

        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Alcohol');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Tapaboca');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Algodón');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Gel desinfectante');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Bisturí');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Guantes');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Gasas quirúrgicas');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Agua oxígenada');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Agua potable');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Camilla');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Hilo quirúrgico');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Pinzas quirúrgicas');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Ropa de pacientes');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Prueba para el COVID19');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Termómetro digital');
        INSERT INTO Insumo (id, nombre)
VALUES (sec_Insumo.nextval, 'Gorro médico');


/*---------------------------AEROLINEA-------------------------------------*/
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','1.png','Qatar Airways', 50);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','2.png','Copa Airlines', 30);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','3.jpg','Avianca', 45);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','4.png','Air France', 30);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','5.jpg','AeroMexico', 20);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','6.png','American Airlines', 25);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','7.png','Laser Airlines', 15);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','8.jpg','Delta Airlines', 11);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','9.png','United Airlines', 30);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','10.png','Air Europa', 23);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','11.jpg','Iberia', 18);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','12.jpg','Turkish Airlines', 30);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','13.png','Plus Ultra', 15);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','14.png','Caribean Airlines', 10);
execute agregaAerolinea ('IMAGEN_DIR_AEROLINEA','15.jpg','Wingo', 16);


/*---------------------------Avion-------------------------------------*/
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'A220', 2002, 3, 'Qatar Airways');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'700', 2005, 3, 'Copa Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'CRJ900', 2004, 2, 'Avianca');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'A320', 1994, 4, 'Air France');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'Boeing717', 1997, 3, 'AeroMexico');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'CRJ900', 1992, 3, 'American Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'A340', 2012, 4, 'Laser Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'Boeing747', 1998, 2, 'Delta Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'A320', 2004, 2, 'United Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'Boeing717', 1994, 3, 'Air Europa');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'Boeing747', 2004, 4, 'Iberia');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'A220', 2011, 3, 'Turkish Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'A350', 1991, 4, 'Plus Ultra');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'A340', 1985, 2, 'Caribean Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion.nextVal,'Boeing787', 2010, 2, 'Wingo');

/*-------------------------Estatus-------------------------*/

insert into Estatus(id,nombre) values (1,'saludable');
insert into Estatus(id,nombre) values (2,'infectado');
insert into Estatus(id,nombre) values (3,'recuperado');
insert into Estatus(id,nombre) values (4,'fallecido');


/*----------------------------Proveedor_Internet------------------------------------*/
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','amena', '1.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','CenturyLink', '2.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','Lowi', '3.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','Jazztel', '4.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','aba CANTV', '5.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','ONO', '6.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','TotalPlay', '7.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','AT&T', '8.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','Aol', '9.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','Fios by verizon', '10.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','UUNET', '11.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','Claro', '12.jpg');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','oi', '13.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','tigo', '14.png');
execute agregaProveedor ('IMAGEN_DIR_PROVEEDOR_INTERNET','inter', '15.png');

/*------------------------Lugar_Proveedor---------------------------------*/
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (1, '11/10/2019', 40.49, 42.65, 7, 16, 1);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (2, '17/11/2019', 90.61, 78.3, 8, 17, 2);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (3, '26/11/2019', 99.73, 70.74, 6, 18, 3);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (4, '21/10/2019', 77.54, 97.94, 11, 19, 4);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (5, '11/11/2019', 54.55, 51.37, 3, 20, 5);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (6, '03/12/2019', 67.69, 3.81, 3, 21, 6);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (7, '14/11/2019', 87.46, 81.68, 1, 22, 7);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (8, '07/12/2019', 39.74, 26.16, 2, 23, 8);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (9, '17/11/2019', 73.14, 36.7, 1, 24, 9);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (10, '24/10/2019', 82.88, 54.79, 5, 25, 10);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (11, '10/12/2019', 45.99, 68.14, 6, 26, 11);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (12, '03/12/2019', 97.72, 12.17, 10, 27, 12);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (13, '15/10/2019', 7.91, 56.51, 7, 28, 13);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (14, '17/12/2019', 88.19, 74.23, 7, 29, 14);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (15, '24/12/2019', 63.41, 7.8, 10, 30, 15);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (16, '14/12/2019', 4.18, 14.32, 7, 31, 1);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (17, '26/11/2019', 75.97, 32.22, 11, 32, 2);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (18, '14/11/2019', 74.72, 21.39, 7, 33, 3);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (19, '25/12/2019', 36.11, 30.96, 11, 34, 4);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (20, '30/11/2019', 45.94, 7.08, 3, 35, 5);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (21, '20/12/2019', 98.18, 25.76, 10, 36, 6);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (22, '02/12/2019', 57.96, 85.05, 8, 37, 7);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (23, '26/10/2019', 12.02, 36.04, 4, 38, 8);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (24, '24/10/2019', 79.59, 3.49, 11, 39, 9);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (25, '10/12/2019', 90.64, 31.92, 2, 40, 10);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (26, '15/11/2019', 21.21, 55.15, 1, 41, 11);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (27, '19/11/2019', 68.46, 76.47, 1, 42, 12);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (28, '11/12/2019', 11.48, 97.76, 5, 43, 13);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (29, '22/10/2019', 91.83, 1.84, 9, 44, 14);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (30, '16/12/2019', 31.04, 96.08, 6, 45, 15);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (31, '29/10/2019', 59.21, 55.33, 4, 46, 1);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (32, '18/10/2019', 14.32, 43.05, 6, 47, 2);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (33, '20/11/2019', 19.63, 21.92, 6, 48, 3);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (34, '12/10/2019', 1.38, 32.99, 12, 49, 4);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (35, '15/11/2019', 91.99, 76.88, 8, 50, 5);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (36, '19/12/2019', 17.53, 32.45, 6, 51, 6);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (37, '05/11/2019', 9.11, 92.7, 11, 52, 7);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (38, '13/10/2019', 88.16, 84.26, 2, 53, 8);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (39, '16/11/2019', 43.74, 14.13, 3, 54, 9);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (40, '29/11/2019', 31.38, 63.8, 2, 55, 10);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (41, '05/10/2019', 50.38, 85.85, 5, 56, 11);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (42, '25/12/2019', 66.66, 44.27, 7, 57, 12);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (43, '26/10/2019', 50.96, 74.8, 3, 58, 13);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (44, '09/12/2019', 91.74, 90.1, 3, 59, 14);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (45, '29/11/2019', 51.52, 51.94, 5, 60, 15);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (46, '25/11/2019', 39.36, 39.52, 12, 61, 1);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (47, '29/12/2019', 65.33, 67.83, 9, 62, 2);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (48, '02/10/2019', 99.74, 89.02, 12, 63, 3);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (49, '17/12/2019', 71.58, 87.98, 10, 64, 4);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (50, '26/12/2019', 31.89, 82.24, 3, 65, 5);

/*--------------------------Ayuda_Humanitaria-----------------------------*/
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '16/01/2020', 7587224, 10, 11);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '07/05/2020', 4403308, 9, 13);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '04/06/2020', 6422941, 9, 14);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '16/05/2020', 9798436, 10, 14);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '13/03/2020', 4804942, 8, 15);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '28/05/2020', 7291356, 9, 11);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '09/04/2020', 2174738, 7, 12);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '22/05/2020', 3112030, 7, 15);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '31/01/2020', 1549538, 6, 15);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '24/02/2020', 1775844, 10, 15);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '15/05/2020', 7558434, 6, 14);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '10/01/2020', 6860927, 10, 15);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '11/06/2020', 3640774, 10, 13);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '04/02/2020', 2227203, 7, 11);
insert into Ayuda_Humanitaria (id, fecha_donacion, cantidad_dinero, fk_pais_donador, fk_pais_ayudado) values (sec_ayuda_humanitaria.nextval, '16/03/2020', 8538112, 9, 13);


/*----------------------------Ayuda_Insumo--------------------------------*/
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 403, 5, 1);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 894, 11, 2);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 759, 1, 3);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 29, 1, 4);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 241, 2, 5);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 157, 7, 6);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 575, 14, 7);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 514, 6, 8);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 439, 5, 9);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 977, 12, 10);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 582, 12, 11);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 219, 13, 12);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 261, 15, 13);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 286, 11, 14);
insert into Ayuda_Insumo (id, cantidad, fk_insumo, fk_ayuda_humanitaria) values (sec_ayuda_insumo.nextval, 790, 7, 15);


/*-------------------------------Modelo-----------------------------------*/
insert into Modelo (id, nombre) values (sec_modelo.nextval, 'Libre Movilidad');
insert into Modelo (id, nombre) values (sec_modelo.nextval, 'Cuarentena');

/*-----------------------------Modelo_Lugar-----------------------------*/
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('30/01/2020', '25/05/2020'),6,1);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('28/02/2020', '22/05/2020'),7,2);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('28/02/2020', '03/03/2020'),8,1);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('26/02/2020', '04/04/2020'),9,2);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('06/02/2020', '11/04/2020'),10,1);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('05/02/2020', '27/05/2020'),11,2);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('15/01/2020', '17/04/2020'),12,1);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('03/02/2020', '20/03/2020'),13,2);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('14/02/2020', '10/04/2020'),14,1);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('28/02/2020', '09/06/2020'),15,2);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('12/02/2020', '20/04/2020'),6,1);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('23/02/2020', '23/04/2020'),7,2);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('03/01/2020', '26/04/2020'),8,1);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('01/02/2020', '13/06/2020'),9,2);
insert into Modelo_Lugar (id, rango_fecha,fk_lugar,fk_modelo) values (sec_modelo_lugar.nextval, Rango_Fecha('21/02/2020', '15/04/2020'),10,1);

/*-------------------------------Frontera------------------------------------*/
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 934, 6);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 139, 7);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 928, 8);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 509, 9);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 103, 10);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 173, 11);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 489, 12);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 804, 13);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha( null, null), 900, 14);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 623, 15);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 236, 6);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 736, 7);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 503, 8);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha( null, null), 773, 9);
insert into Frontera (id,  rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha(null, null), 197, 10);




/*-------------------------Ejecutar Personas.sql--------------------------*/

/*-------------------------Ejecutar Centro_Atencion.sql-----------------------*/

/*-------------------------Centro_Insumo.sql-------------------------------*/

/*-------------------------Ejecutar Estatus_Persona.sql-----------------------*/

/*-------------------------Ejecutar Patologia_Persona.sql-----------------------*/

/*-------------------------Ejecutar Sintoma_Persona.sql-----------------------*/

/*-------------------------Ejecutar Viaje.sql------------------------*/

/*-------------------------Ejecutar Registro.sql---------------------*/
