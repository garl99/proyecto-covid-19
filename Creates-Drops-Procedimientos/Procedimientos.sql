CREATE OR REPLACE PROCEDURE agregaImagen

   (directorio IN varchar2, archivoImagen IN varchar2, pais varchar2, tipo varchar2, poblacion number) as

   f_lob bfile;

   b_lob blob;

BEGIN

   f_lob := bfilename(directorio, archivoImagen);

   INSERT INTO Lugar VALUES ( sec_Lugar.nextVal, pais, tipo, poblacion, empty_blob(), Info_Cantidad (0,0,0,0,0,0), null )

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

CREATE OR REPLACE PROCEDURE agregaProveedor

   (directorio IN varchar2, 
   nombre IN varchar2,
   archivoImagen IN varchar2) as

   f_lob bfile;

   b_lob blob;


BEGIN

   f_lob := bfilename(directorio, archivoImagen);

   INSERT INTO Proveedor_Internet VALUES (sec_proveedor_internet.nextval, nombre, empty_blob() )

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



/*------------------------------DROP PROCEDURES------------------------------*/
    drop procedure "AGREGAEROLINEA";
    drop procedure "AGREGAPERSONA";
    drop procedure "AGREGAPROVEEDOR";
    drop procedure "AGREGAIMAGEN";
