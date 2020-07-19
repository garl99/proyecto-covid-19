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

/*------------------------Lugar_Proveedor---------------------------------*/   -- >>> BORRAR E INSERTAR DE NUEVO

insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '12/06/2020', 9.8, 6.15, 13, 6, 2);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '22/06/2020', 8.21, 2.82, 15, 7, 7);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '17/06/2020', 8.04, 12.23, 12, 8, 13);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '27/05/2020', 7.1, 14.6, 6, 9, 9);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '27/05/2020', 6.23, 12.8, 4, 10, 15);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '29/05/2020', 7.42, 12.93, 13, 11, 2);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '06/06/2020', 8.4, 17.57, 4, 12, 9);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '30/06/2020', 6.64, 4.63, 14, 13, 8);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '21/06/2020', 8.65, 17.49, 4, 14, 9);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '28/05/2020', 8.8, 7.77, 6, 15, 6);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '23/06/2020', 7.07, 9.71, 6, 6, 8);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '03/06/2020', 6.73, 8.96, 8, 7, 11);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '30/06/2020', 2.28, 4.0, 10, 8, 2);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '08/06/2020', 8.5, 12.98, 5, 9, 5);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '25/06/2020', 6.92, 8.86, 6, 10, 5);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '08/06/2020', 4.53, 6.31, 13, 11, 9);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '21/06/2020', 5.59, 10.63, 15, 12, 8);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '02/06/2020', 9.68, 13.63, 9, 13, 5);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '06/06/2020', 8.68, 13.07, 6, 14, 11);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '27/05/2020', 8.78, 17.8, 13, 15, 5);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '22/06/2020', 8.19, 13.66, 13, 6, 14);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '05/06/2020', 4.89, 18.19, 4, 7, 10);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '01/06/2020', 5.71, 12.51, 6, 8, 8);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '09/06/2020', 7.62, 15.98, 2, 9, 4);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '06/06/2020', 3.3, 17.26, 14, 10, 14);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '16/06/2020', 9.35, 3.72, 6, 11, 1);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '26/06/2020', 2.75, 3.96, 14, 12, 2);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '05/06/2020', 8.89, 16.18, 15, 13, 12);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '31/05/2020', 8.0, 8.78, 15, 14, 7);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '18/06/2020', 7.45, 10.31, 4, 15, 12);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '22/06/2020', 5.41, 6.05, 3, 6, 6);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '27/05/2020', 5.17, 19.49, 2, 7, 6);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '16/06/2020', 6.18, 12.72, 6, 8, 9);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '06/06/2020', 6.71, 5.35, 14, 9, 7);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '15/06/2020', 8.24, 9.05, 14, 10, 9);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '11/06/2020', 6.77, 17.67, 5, 11, 10);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '05/06/2020', 9.98, 10.38, 10, 12, 15);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '08/06/2020', 6.76, 18.85, 2, 13, 4);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '18/06/2020', 7.67, 12.61, 11, 14, 1);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '12/06/2020', 4.2, 2.01, 9, 15, 8);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '27/05/2020', 9.46, 13.52, 12, 6, 4);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '28/05/2020', 9.33, 12.83, 2, 7, 14);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '27/05/2020', 4.63, 6.96, 5, 8, 1);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '29/06/2020', 4.75, 2.22, 7, 9, 6);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '28/06/2020', 8.27, 17.62, 12, 10, 2);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '29/05/2020', 6.94, 10.36, 14, 11, 4);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '01/06/2020', 6.26, 13.56, 13, 12, 5);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '15/06/2020', 6.36, 13.09, 10, 13, 6);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '05/06/2020', 6.69, 9.07, 10, 14, 10);
insert into Lugar_Proveedor (id, fecha, velocidad_subida, velocidad_bajada, horas_interrupcion, fk_lugar, fk_proveedor) values (sec_lugar_proveedor.nextval, '14/06/2020', 3.62, 10.02, 8, 15, 3);

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

/*-------------------------------Frontera------------------------------------*/ -- >>> BORRAR E INSERTAR DE NUEVO

insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('01/06/2020',null), 508, 6);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('01/06/2020',null), 705, 7);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('10/06/2020','24/06/2020'), 879, 8);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('19/06/2020','01/07/2020'), 507,9);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('01/06/2020',null), 978,10);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('10/06/2020','24/06/2020'), 792,11);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('01/06/2020','25/06/2020'), 658,12);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('19/06/2020','01/07/2020'), 248,13);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('01/06/2020',null), 674,14);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('19/06/2020','01/07/2020'), 951,15);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('01/06/2020','25/06/2020'), 680,7);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('19/06/2020','01/07/2020'), 252,9);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('01/06/2020','25/06/2020'), 982,11);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('10/06/2020','24/06/2020'), 103,13);
insert into Frontera (id, rango_fecha, longitud, fk_lugar) values (sec_frontera.nextval, Rango_Fecha('01/06/2020','25/06/2020'), 191,15);


/*-------------------------Ejecutar Personas.sql--------------------------*/

/*-------------------------Ejecutar Centro_Atencion.sql-----------------------*/

/*-------------------------Centro_Insumo.sql-------------------------------*/

/*-------------------------Ejecutar Estatus_Persona.sql-----------------------*/

/*-------------------------Ejecutar Patologia_Persona.sql-----------------------*/

/*-------------------------Ejecutar Sintoma_Persona.sql-----------------------*/

/*-------------------------Ejecutar Viaje.sql------------------------*/

/*-------------------------Ejecutar Registro.sql---------------------*/
