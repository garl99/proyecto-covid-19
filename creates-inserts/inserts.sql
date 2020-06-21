create directory IMAGEN_DIR_AEROLINEA as 'C:\Proyecto\Aerolineas';
create directory IMAGEN_DIR_PERSONAS as'C:\Proyecto\Personas';


create sequence sec_persona
start with 1
increment by 1;

create sequence sec_centro_atencion
start with 1
increment by 1;


create sequence sec_estatus_persona
start with 1
increment by 1;

create sequence sec_patologia_persona
start with 1
increment by 1;

create sequence sec_sintoma_persona
start with 1
increment by 1;

create sequence sec_viaje
start with 1
increment by 1;

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
    