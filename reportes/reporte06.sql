CREATE OR REPLACE PROCEDURE Reporte6(pais varchar2, fecha_inicio date, fecha_fin date, cursore out SYS_REFCURSOR) 
IS
    bandera lugar.bandera%type;
    id_pais lugar.id%type;
    fecha date;
    cantidad registro.cantidad_infectados%type;
    iden number;
BEGIN
        IF (pais IS NOT NULL AND fecha_inicio IS NOT NULL AND fecha_fin IS NOT NULL) THEN
            SELECT ID INTO id_pais FROM Lugar WHERE Nombre = pais AND Tipo = 'pais';     
            OPEN cursore FOR
            SELECT l.bandera, r.fecha_registro, r.cantidad_infectados, r.id
            INTO bandera, fecha, cantidad, iden
            FROM Lugar l, Registro  r
            WHERE r.fk_lugar = l.id  AND l.id=id_pais AND TO_DATE(r.fecha_registro,'DD/MM/YYYY') BETWEEN TO_DATE(fecha_inicio,'DD/MM/YYYY') 
            AND TO_DATE(fecha_fin,'DD/MM/YYYY');
        ELSE IF (pais IS NOT NULL AND fecha_inicio IS NOT NULL AND fecha_fin IS NULL) THEN
            SELECT ID INTO id_pais FROM Lugar WHERE Nombre = pais AND Tipo = 'pais'; 
            OPEN cursore FOR
            SELECT l.bandera, r.fecha_registro, r.cantidad_infectados, r.id
            INTO bandera, fecha, cantidad, iden
            FROM Lugar l, Registro  r
            WHERE r.fk_lugar = l.id  AND l.id=id_pais AND TO_DATE(r.fecha_registro,'DD/MM/YYYY') >= TO_DATE(fecha_inicio,'DD/MM/YYYY');
        ELSE IF (pais IS NOT NULL AND fecha_inicio IS NULL AND fecha_fin IS NOT NULL) THEN
            SELECT ID INTO id_pais FROM Lugar WHERE Nombre = pais AND Tipo = 'pais'; 
            OPEN cursore FOR
            SELECT l.bandera, r.fecha_registro, r.cantidad_infectados, r.id
            INTO bandera, fecha, cantidad, iden
            FROM Lugar l, Registro  r
            WHERE r.fk_lugar = l.id  AND l.id=id_pais AND TO_DATE(r.fecha_registro,'DD/MM/YYYY') <= TO_DATE(fecha_fin,'DD/MM/YYYY');
        ELSE IF (pais IS NOT NULL AND fecha_inicio IS NULL AND fecha_fin IS NULL) THEN
            SELECT ID INTO id_pais FROM Lugar WHERE Nombre = pais AND Tipo = 'pais'; 
            OPEN cursore FOR
            SELECT l.bandera, r.fecha_registro, r.cantidad_infectados, r.id
            INTO bandera, fecha, cantidad, iden
            FROM Lugar l, Registro  r
            WHERE r.fk_lugar = l.id  AND l.id=id_pais;
        ELSE IF (pais IS NULL AND fecha_inicio IS NOT NULL AND fecha_fin IS NOT NULL) THEN
            SELECT ID INTO id_pais FROM Lugar WHERE Nombre = pais AND Tipo = 'pais';     
            OPEN cursore FOR
            SELECT l.bandera, r.fecha_registro, r.cantidad_infectados, r.id
            INTO bandera, fecha, cantidad, iden
            FROM Lugar l, Registro  r
            WHERE r.fk_lugar = l.id AND TO_DATE(r.fecha_registro,'DD/MM/YYYY') BETWEEN TO_DATE(fecha_inicio,'DD/MM/YYYY') 
            AND TO_DATE(fecha_fin,'DD/MM/YYYY');
        ELSE IF (pais IS NULL AND fecha_inicio IS NOT NULL AND fecha_fin IS NULL) THEN
            OPEN cursore FOR
            SELECT l.bandera, r.fecha_registro, r.cantidad_infectados, r.id
            INTO bandera, fecha, cantidad, iden
            FROM Lugar l, Registro  r
            WHERE r.fk_lugar = l.id  AND TO_DATE(r.fecha_registro,'DD/MM/YYYY') >= TO_DATE(fecha_inicio,'DD/MM/YYYY');
        ELSE IF (pais IS NULL AND fecha_inicio IS NULL AND fecha_fin IS NOT NULL) THEN
            OPEN cursore FOR
            SELECT l.bandera, r.fecha_registro, r.cantidad_infectados, r.id
            INTO bandera, fecha, cantidad, iden
            FROM Lugar l, Registro  r
            WHERE r.fk_lugar = l.id  AND  TO_DATE(r.fecha_registro,'DD/MM/YYYY') <= TO_DATE(fecha_fin,'DD/MM/YYYY');
        ELSE IF (pais IS NULL AND fecha_inicio IS NULL AND fecha_fin IS NULL) THEN
            OPEN cursore FOR
            SELECT l.bandera, r.fecha_registro, r.cantidad_infectados, r.id
            INTO bandera, fecha, cantidad, iden
            FROM Lugar l, Registro  r
            WHERE r.fk_lugar = l.id;
        END IF;
        END IF;
        END IF;
        END IF;
        END IF;
        END IF;
        END IF;
        END IF;
END;

set autoprint on;
variable cursore refcursor;
execute Reporte6('Estados Unidos','8/06/2020', '12/06/2020',:cursore);