Create sequence seq_Lugar start with 1 increment by 1;

create directory Image as  'C:\Banderas';

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

execute agregaImagen('IMAGE', 'usa.png', 'Estados Unidos', 'pais', 328000000);
execute agregaImagen('IMAGE', 'alemania.png', 'Alemania', 'pais', 83200000);
execute agregaImagen('IMAGE', 'brasil.jpg', 'Brasil', 'pais', 209000000);
execute agregaImagen('IMAGE', 'chile.png', 'Chile', 'pais', 18730000);
execute agregaImagen('IMAGE', 'china.jpg', 'China', 'pais', 1393000000);
execute agregaImagen('IMAGE', 'espana.png', 'España', 'pais', 46940000);
execute agregaImagen('IMAGE', 'francia.png', 'Francia', 'pais', 66900000);
execute agregaImagen('IMAGE', 'india.png',  'India', 'pais', 1353000000);
execute agregaImagen('IMAGE', 'reino.png', 'Reino Unido', 'pais', 66650000);
execute agregaImagen('IMAGE', 'iran.jpg',  'Iran', 'pais', 81800000);
execute agregaImagen('IMAGE', 'italia.png',  'Italia', 'pais', 60360000);
execute agregaImagen('IMAGE', 'mexico.png', 'Mexico', 'pais', 126200000);  
execute agregaImagen('IMAGE', 'peru.png',  'Peru', 'pais', 31990000); 
execute agregaImagen('IMAGE', 'rusia.jpg', 'Rusia', 'pais', 144500000); 
execute agregaImagen('IMAGE', 'venezuela.png', 'Venezuela', 'pais', 28870000);

insert into Lugar values(seq_Lugar.nextVal, 'California', 'estado', 39510000, null, null, 1);
insert into Lugar values(seq_Lugar.nextVal, 'Texas', 'estado', 29000000, null, null, 1);
insert into Lugar values(seq_Lugar.nextVal, 'Florida', 'estado', 21480000, null, null, 1);
insert into Lugar values(seq_Lugar.nextVal, 'Arizona', 'estado', 7279000, null, null, 1);
insert into Lugar values(seq_Lugar.nextVal, 'Colorado', 'estado', 5759000, null, null, 1);

insert into Lugar values(seq_Lugar.nextVal, 'Berlin', 'estado', 3769000, null, null, 2);
insert into Lugar values(seq_Lugar.nextVal, 'Hamburgo', 'estado', 1899000, null, null, 2);
insert into Lugar values(seq_Lugar.nextVal, 'Munich', 'estado', 1472000, null, null, 2);
insert into Lugar values(seq_Lugar.nextVal, 'Colonia', 'estado', 1061000, null, null, 2);
insert into Lugar values(seq_Lugar.nextVal, 'Frankfurt', 'estado', 753056, null, null, 2);

insert into Lugar values(seq_Lugar.nextVal, 'Sao Paulo', 'estado', 41250000, null, null, 3);
insert into Lugar values(seq_Lugar.nextVal, 'Minas', 'estado', 21160000, null, null, 3);
insert into Lugar values(seq_Lugar.nextVal, 'Rio de Janeiro', 'estado', 17260000, null, null, 3);
insert into Lugar values(seq_Lugar.nextVal, 'Bahia', 'estado', 15150000, null, null, 3);
insert into Lugar values(seq_Lugar.nextVal, 'Rio Grande', 'estado', 11228000, null, null, 3);

insert into Lugar values(seq_Lugar.nextVal, 'Santiago', 'estado', 7112800, null, null, 4);
insert into Lugar values(seq_Lugar.nextVal, 'Valparaiso', 'estado', 1815900, null, null, 4);
insert into Lugar values(seq_Lugar.nextVal, 'Biobio', 'estado', 1556800, null, null, 4);
insert into Lugar values(seq_Lugar.nextVal, 'Maule', 'estado', 1044950, null, null, 4);
insert into Lugar values(seq_Lugar.nextVal, 'La Araucania', 'estado', 957224, null, null, 4);

insert into Lugar values(seq_Lugar.nextVal, 'Shanghai', 'estado', 24280000, null, null, 5);
insert into Lugar values(seq_Lugar.nextVal, 'Pekin', 'estado', 21710000, null, null, 5);
insert into Lugar values(seq_Lugar.nextVal, 'Canton', 'estado', 13995790, null, null, 5);
insert into Lugar values(seq_Lugar.nextVal, 'Shanzhen', 'estado', 16557170, null, null, 5);
insert into Lugar values(seq_Lugar.nextVal, 'Tianjin', 'estado', 19898560, null, null, 5);

insert into Lugar values(seq_Lugar.nextVal, 'Madrid', 'estado', 6685500, null, null, 6);
insert into Lugar values(seq_Lugar.nextVal, 'Barcelona', 'estado', 5664579, null, null, 6);
insert into Lugar values(seq_Lugar.nextVal, 'Valencia', 'estado', 2565120, null, null, 6);
insert into Lugar values(seq_Lugar.nextVal, 'Sevilla', 'estado', 1939890, null, null, 6);
insert into Lugar values(seq_Lugar.nextVal, 'Alicante', 'estado', 1858690, null, null, 6);

insert into Lugar values(seq_Lugar.nextVal, 'Paris', 'estado', 2148000, null, null, 7);
insert into Lugar values(seq_Lugar.nextVal, 'Marsella', 'estado', 855393, null, null, 7);
insert into Lugar values(seq_Lugar.nextVal, 'Lyon', 'estado', 500715, null, null, 7);
insert into Lugar values(seq_Lugar.nextVal, 'Toulouse', 'estado', 458298, null, null, 7);
insert into Lugar values(seq_Lugar.nextVal, 'Niza', 'estado', 342295, null, null, 7);

insert into Lugar values(seq_Lugar.nextVal, 'Uttar Pradesh', 'estado', 235841027, null, null, 8);
insert into Lugar values(seq_Lugar.nextVal, 'Maharashtra', 'estado', 128428785, null, null, 8);
insert into Lugar values(seq_Lugar.nextVal, 'Bihar', 'estado', 127640590, null, null, 8);
insert into Lugar values(seq_Lugar.nextVal, 'Bengala', 'estado', 80221170, null, null, 8);
insert into Lugar values(seq_Lugar.nextVal, 'Madhya Pradesh', 'estado', 2377280, null, null, 8);

insert into Lugar values(seq_Lugar.nextVal, 'Londres', 'estado', 9248670, null, null, 9);
insert into Lugar values(seq_Lugar.nextVal, 'Birmingham', 'estado', 1157580, null, null, 9);
insert into Lugar values(seq_Lugar.nextVal, 'Glasgow', 'estado', 613050, null, null, 9);
insert into Lugar values(seq_Lugar.nextVal, 'Liverpool', 'estado', 488263, null, null, 9);
insert into Lugar values(seq_Lugar.nextVal, 'Leeds', 'estado', 798825, null, null, 9);

insert into Lugar values(seq_Lugar.nextVal, 'Teheran', 'estado', 15234000, null, null, 10);
insert into Lugar values(seq_Lugar.nextVal, 'Fars', 'estado', 5550000, null, null, 10);
insert into Lugar values(seq_Lugar.nextVal, 'Isfahan', 'estado', 1961260, null, null, 10);
insert into Lugar values(seq_Lugar.nextVal, 'Razavi', 'estado', 5243670, null, null, 10);
insert into Lugar values(seq_Lugar.nextVal, 'Qom', 'estado', 3074037, null, null, 10);

insert into Lugar values(seq_Lugar.nextVal, 'Roma', 'estado', 3458580, null, null, 11);
insert into Lugar values(seq_Lugar.nextVal, 'Milan', 'estado', 1550588, null, null, 11);
insert into Lugar values(seq_Lugar.nextVal, 'Napoles', 'estado', 1012034, null, null, 11);
insert into Lugar values(seq_Lugar.nextVal, 'Turin', 'estado', 947653, null, null, 11);
insert into Lugar values(seq_Lugar.nextVal, 'Palermo', 'estado', 722374, null, null, 11);

insert into Lugar values(seq_Lugar.nextVal, 'Ciudad de Mexico', 'estado', 8555842, null, null, 12);
insert into Lugar values(seq_Lugar.nextVal, 'Jalisco', 'estado', 8368602, null, null, 12);
insert into Lugar values(seq_Lugar.nextVal, 'Puebla', 'estado', 1600092, null, null, 12);
insert into Lugar values(seq_Lugar.nextVal, 'Chihuahua', 'estado', 1019609, null, null, 12);
insert into Lugar values(seq_Lugar.nextVal, 'Monterrey', 'estado', 1233141, null, null, 12);

insert into Lugar values(seq_Lugar.nextVal, 'Lima', 'estado', 9674755, null, null, 13);
insert into Lugar values(seq_Lugar.nextVal, 'Arequipa', 'estado', 1316000, null, null, 13);
insert into Lugar values(seq_Lugar.nextVal, 'Trujillo', 'estado', 970000, null, null, 13);
insert into Lugar values(seq_Lugar.nextVal, 'Cuzco', 'estado', 1205530, null, null, 13);
insert into Lugar values(seq_Lugar.nextVal, 'Loreto', 'estado', 830000, null, null, 13);

insert into Lugar values(seq_Lugar.nextVal, 'Moscu', 'estado', 11500000, null, null, 14);
insert into Lugar values(seq_Lugar.nextVal, 'San Petesburgo', 'estado', 5523780, null, null, 14);
insert into Lugar values(seq_Lugar.nextVal, 'Novosibirsk', 'estado', 1666331, null, null, 14);
insert into Lugar values(seq_Lugar.nextVal, 'Ekaterinburgo', 'estado', 1510000, null, null, 14);
insert into Lugar values(seq_Lugar.nextVal, 'Samara', 'estado', 1178999, null, null, 14);

insert into Lugar values(seq_Lugar.nextVal, 'Distrito Capital', 'estado', 4946956, null, null, 15);
insert into Lugar values(seq_Lugar.nextVal, 'Zulia', 'estado', 4280715, null, null, 15);
insert into Lugar values(seq_Lugar.nextVal, 'Miranda', 'estado', 3218038, null, null, 15);
insert into Lugar values(seq_Lugar.nextVal, 'Carabobo', 'estado', 2538085, null, null, 15);
insert into Lugar values(seq_Lugar.nextVal, 'Lara', 'estado', 2219211, null, null, 15);


DELETE FROM LUGAR ;





