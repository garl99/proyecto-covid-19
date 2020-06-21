create directory Image as  'C:\Proyecto\Banderas';
create directory IMAGEN_DIR_AEROLINEA as 'C:\Proyecto\Aerolineas';
create directory IMAGEN_DIR_PERSONAS as'C:\Proyecto\Personas';

CREATE OR REPLACE PROCEDURE agregaImagen

   (directorio IN varchar2, archivoImagen IN varchar2, pais varchar2, tipo varchar2, poblacion number) as

   f_lob bfile;

   b_lob blob;

BEGIN

   f_lob := bfilename(directorio, archivoImagen);

   INSERT INTO Lugar VALUES ( seq_Lugar.nextVal, pais, tipo, poblacion, empty_blob(), null, null )

   RETURNING BANDERA into b_lob;

   --Abrir archivo

   dbms_lob.fileopen(f_lob,dbms_lob.file_readonly);

   --Leer archivo

   dbms_lob.loadfromfile(b_lob, f_lob, dbms_lob.getlength(f_lob));

   --Cerrar archivo

   dbms_lob.fileclose(f_lob);

   commit;

END;


CREATE OR REPLACE PROCEDURE agregaAerolinea

   (directorio IN varchar2, archivoImagen IN varchar2, nombre IN varchar2, n_flota IN number) as

   f_lob bfile;

   b_lob blob;


BEGIN

   f_lob := bfilename(directorio, archivoImagen);

   INSERT INTO Aerolinea VALUES ( nombre, n_flota, empty_blob() )

   RETURNING logo into b_lob;

   --Abrir archivo

   dbms_lob.fileopen(f_lob,dbms_lob.file_readonly);

   --Leer archivo

   dbms_lob.loadfromfile(b_lob, f_lob, dbms_lob.getlength(f_lob));

   --Cerrar archivo

   dbms_lob.fileclose(f_lob);

   commit;

END;

CREATE OR REPLACE PROCEDURE agregaPersona

   (directorio IN varchar2, 
   archivoImagen IN varchar2,
   primer_nombre IN varchar2, 
   segundo_nombre IN varchar2,
   primer_apellido IN varchar2,
   segundo_apellido IN varchar2,
   genero IN char,
   fecha_nacimiento IN varchar2,
   id_pasajero IN number,
   fk_lugar IN number) as

   f_lob bfile;

   b_lob blob;

   tipo varchar2(20);
BEGIN

   if id_pasajero is null then
     tipo:='persona';
   else
     tipo:='pasajero';
   end if;



   f_lob := bfilename(directorio, archivoImagen);


   INSERT INTO Persona VALUES (sec_persona.nextval, Info_Persona(
                              primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,
                              TO_DATE(fecha_nacimiento,'DD/MM/YYYY'),genero),
                              empty_blob(),id_pasajero,tipo,fk_lugar)
   RETURNING foto into b_lob;

   --Abrir archivo

   dbms_lob.fileopen(f_lob,dbms_lob.file_readonly);

   --Leer archivo

   dbms_lob.loadfromfile(b_lob, f_lob, dbms_lob.getlength(f_lob));

   --Cerrar archivo

   dbms_lob.fileclose(f_lob);

   commit;

END;


/*Patologías*/

INSERT INTO Patologia (id, nombre)
VALUES (sec_Patalogia.nextval, 'Diabetes'),
       (sec_Patalogia.nextval, 'Cáncer'),
       (sec_Patalogia.nextval, 'Hipertensión'),
       (sec_Patalogia.nextval, 'Asma'),
       (sec_Patalogia.nextval, 'Alzheimer'),
       (sec_Patalogia.nextval, 'SIDA'),
       (sec_Patalogia.nextval, 'Lupus'),
       (sec_Patalogia.nextval, 'Poliomielitis'),
       (sec_Patalogia.nextval, 'Gripe'),
       (sec_Patalogia.nextval, 'Alzheimer'),
       (sec_Patalogia.nextval, 'Anemia'),
       (sec_Patalogia.nextval, 'Dengue'),
       (sec_Patalogia.nextval, 'Amigdalitis'),
       (sec_Patalogia.nextval, 'Sarampión'),
       (sec_Patalogia.nextval, 'Varicela'),
       (sec_Patalogia.nextval, 'Infección Urinaria');
       
/*Sintomas*/
       
       
INSERT INTO Sintoma (id, nombre)
VALUES  (sec_Sintoma.nextval, 'Fiebre'),
        (sec_Sintoma.nextval, 'Tos seca'),
        (sec_Sintoma.nextval, 'Cansancio'),
        (sec_Sintoma.nextval, 'Molestia y dolores'),
        (sec_Sintoma.nextval, 'Dolor de garganta'),
        (sec_Sintoma.nextval, 'Diarrea'),
        (sec_Sintoma.nextval, 'Conjuntivitis'),
        (sec_Sintoma.nextval, 'Dolor de cabeza'),
        (sec_Sintoma.nextval, 'Pérdida del gusto'),
        (sec_Sintoma.nextval, 'Erupciones cutáneas'),
        (sec_Sintoma.nextval, 'Dolor de cabeza'),
        (sec_Sintoma.nextval, 'Dificultad para respirar'),
        (sec_Sintoma.nextval, 'Dolor en el pecho'),
        (sec_Sintoma.nextval, 'Incapacidad para moverse'),
        (sec_Sintoma.nextval, 'Incapacidad para hablar');
        
/*Insumos*/

INSERT INTO Insumo (id, nombre)
VALUES  (sec_Insumo.nextval, 'Alcohol'),
        (sec_Insumo.nextval, 'Tapaboca'),
        (sec_Insumo.nextval, 'Algodón'),
        (sec_Insumo.nextval, 'Gel desinfectante'),
        (sec_Insumo.nextval, 'Bisturí'),
        (sec_Insumo.nextval, 'Guantes'),
        (sec_Insumo.nextval, 'Gasas quirúrgicas'),
        (sec_Insumo.nextval, 'Agua oxígenada'),
        (sec_Insumo.nextval, 'Agua potable'),
        (sec_Insumo.nextval, 'Camilla'),
        (sec_Insumo.nextval, 'Hilo quirúrgico'),
        (sec_Insumo.nextval, 'Pinzas quirúrgicas'),
        (sec_Insumo.nextval, 'Ropa de pacientes'),
        (sec_Insumo.nextval, 'Prueba para el COVID19'),
        (sec_Insumo.nextval, 'Termómetro digital'),
        (sec_Insumo.nextval, 'Gorro médico');


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

insert into Lugar values(sec_Lugar.nextVal, 'California', 'estado', 39510000, null, null, 6);
insert into Lugar values(sec_Lugar.nextVal, 'Texas', 'estado', 29000000, null, null, 6);
insert into Lugar values(sec_Lugar.nextVal, 'Florida', 'estado', 21480000, null, null, 6);
insert into Lugar values(sec_Lugar.nextVal, 'Arizona', 'estado', 7279000, null, null, 6);
insert into Lugar values(sec_Lugar.nextVal, 'Colorado', 'estado', 5759000, null, null, 6);

insert into Lugar values(sec_Lugar.nextVal, 'Berlin', 'estado', 3769000, null, null, 7);
insert into Lugar values(sec_Lugar.nextVal, 'Hamburgo', 'estado', 1899000, null, null, 7);
insert into Lugar values(sec_Lugar.nextVal, 'Munich', 'estado', 1472000, null, null, 7);
insert into Lugar values(sec_Lugar.nextVal, 'Colonia', 'estado', 1061000, null, null, 7);
insert into Lugar values(sec_Lugar.nextVal, 'Frankfurt', 'estado', 753056, null, null, 7);

insert into Lugar values(sec_Lugar.nextVal, 'Sao Paulo', 'estado', 41250000, null, null, 8);
insert into Lugar values(sec_Lugar.nextVal, 'Minas', 'estado', 21170000, null, null, 8);
insert into Lugar values(sec_Lugar.nextVal, 'Rio de Janeiro', 'estado', 17260000, null, null, 8);
insert into Lugar values(sec_Lugar.nextVal, 'Bahia', 'estado', 15150000, null, null, 8);
insert into Lugar values(sec_Lugar.nextVal, 'Rio Grande', 'estado', 11228000, null, null, 8);


insert into Lugar values(sec_Lugar.nextVal, 'Shanghai', 'estado', 24280000, null, null, 9);
insert into Lugar values(sec_Lugar.nextVal, 'Pekin', 'estado', 21710000, null, null, 9);
insert into Lugar values(sec_Lugar.nextVal, 'Canton', 'estado', 13995790, null, null, 9);
insert into Lugar values(sec_Lugar.nextVal, 'Shanzhen', 'estado', 17557170, null, null, 9);
insert into Lugar values(sec_Lugar.nextVal, 'Tianjin', 'estado', 19898560, null, null, 9);

insert into Lugar values(sec_Lugar.nextVal, 'Madrid', 'estado', 6685500, null, null, 10);
insert into Lugar values(sec_Lugar.nextVal, 'Barcelona', 'estado', 5664579, null, null, 10);
insert into Lugar values(sec_Lugar.nextVal, 'Valencia', 'estado', 2565120, null, null, 10);
insert into Lugar values(sec_Lugar.nextVal, 'Sevilla', 'estado', 1939890, null, null, 10);
insert into Lugar values(sec_Lugar.nextVal, 'Alicante', 'estado', 1858690, null, null, 10);

insert into Lugar values(sec_Lugar.nextVal, 'Paris', 'estado', 2148000, null, null, 11);
insert into Lugar values(sec_Lugar.nextVal, 'Marsella', 'estado', 855393, null, null, 11);
insert into Lugar values(sec_Lugar.nextVal, 'Lyon', 'estado', 500715, null, null, 11);
insert into Lugar values(sec_Lugar.nextVal, 'Toulouse', 'estado', 458298, null, null, 11);
insert into Lugar values(sec_Lugar.nextVal, 'Niza', 'estado', 342295, null, null, 11);

insert into Lugar values(sec_Lugar.nextVal, 'Londres', 'estado', 9248670, null, null, 12);
insert into Lugar values(sec_Lugar.nextVal, 'Birmingham', 'estado', 1157580, null, null, 12);
insert into Lugar values(sec_Lugar.nextVal, 'Glasgow', 'estado', 613050, null, null, 12);
insert into Lugar values(sec_Lugar.nextVal, 'Liverpool', 'estado', 488263, null, null, 12);
insert into Lugar values(sec_Lugar.nextVal, 'Leeds', 'estado', 798825, null, null, 12);

insert into Lugar values(sec_Lugar.nextVal, 'Roma', 'estado', 3458580, null, null, 13);
insert into Lugar values(sec_Lugar.nextVal, 'Milan', 'estado', 1550588, null, null, 13);
insert into Lugar values(sec_Lugar.nextVal, 'Napoles', 'estado', 1012034, null, null, 13);
insert into Lugar values(sec_Lugar.nextVal, 'Turin', 'estado', 947653, null, null, 13);
insert into Lugar values(sec_Lugar.nextVal, 'Palermo', 'estado', 722374, null, null, 13);

insert into Lugar values(sec_Lugar.nextVal, 'Moscu', 'estado', 11500000, null, null, 14);
insert into Lugar values(sec_Lugar.nextVal, 'San Petesburgo', 'estado', 5523780, null, null, 14);
insert into Lugar values(sec_Lugar.nextVal, 'Novosibirsk', 'estado', 1766331, null, null, 14);
insert into Lugar values(sec_Lugar.nextVal, 'Ekaterinburgo', 'estado', 1510000, null, null, 14);
insert into Lugar values(sec_Lugar.nextVal, 'Samara', 'estado', 1178999, null, null, 14);

insert into Lugar values(sec_Lugar.nextVal, 'Distrito Capital', 'estado', 4946956, null, null, 15);
insert into Lugar values(sec_Lugar.nextVal, 'Zulia', 'estado', 4280715, null, null, 15);
insert into Lugar values(sec_Lugar.nextVal, 'Miranda', 'estado', 3218038, null, null, 15);
insert into Lugar values(sec_Lugar.nextVal, 'Lara', 'estado', 2219211, null, null, 15);
insert into Lugar values(sec_Lugar.nextVal, 'Carabobo', 'estado', 2538085, null, null, 15);



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
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'A220', 2002, 3, 'Qatar Airways');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'700', 2005, 3, 'Copa Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'CRJ900', 2004, 2, 'Avianca');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'A320', 1994, 4, 'Air France');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'Boeing717', 1997, 3, 'AeroMexico');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'CRJ900', 1992, 3, 'American Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'A340', 2012, 4, 'Laser Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'Boeing747', 1998, 2, 'Delta Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'A320', 2004, 2, 'United Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'Boeing717', 1994, 3, 'Air Europa');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'Boeing747', 2004, 4, 'Iberia');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'A220', 2011, 3, 'Turkish Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'A350', 1991, 4, 'Plus Ultra');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'A340', 1985, 2, 'Caribean Airlines');
insert into Avion (id,modelo, fecha, n_motores, fk_aerolinea) values (sec_avion,'Boeing787', 2010, 2, 'Wingo');


/*------------------------------DROP PROCEDURES---------------------------*/
    drop procedure "AGREGAEROLINEA";
    drop procedure "AGREGAPERSONA";
