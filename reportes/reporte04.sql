create or replace PROCEDURE Reporte4(pais varchar2, estado varchar2, cursore out SYS_REFCURSOR) 
IS
    bandera lugar.bandera%type;
    nombre_estado  lugar.nombre%type;
    poblacion lugar.n_poblacion%type;
    infectados number;
    porcentaje_infectados varchar(20);
    fallecidos number;
    porcentaje_fallecidos varchar(20);
    recuperados number;
    porcentaje_recuperados varchar(20);
    id_pais lugar.id%type;
    id_estado lugar.id%type;
BEGIN   
        IF (pais IS NOT NULL) THEN
        SELECT ID INTO id_pais FROM Lugar WHERE Nombre = pais;
        END IF;
        IF (estado IS NOT NULL) THEN
        SELECT ID INTO id_estado FROM Lugar WHERE Nombre = estado;
        END IF;
        IF ((pais IS NOT NULL) AND (estado IS NOT NULL)) THEN
        OPEN cursore FOR
                 SELECT P.Bandera, L.Nombre, P.N_Poblacion,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND (EP.FK_Estatus = 2 OR EP.FK_Estatus = 3 OR EP.FK_Estatus = 4)) AS Total_Infectados,
                (((SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND (EP.FK_Estatus = 2 OR EP.FK_Estatus = 3 OR EP.FK_Estatus = 4))/P.N_Poblacion)*100||'%') AS Porcentaje_Infectados,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 4) AS Total_Fallecidos,
                (((SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 4)/P.N_Poblacion)*100||'%') AS Porcentaje_Fallecidos,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 3) AS Total_Recuperados,
                (((SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 3)/P.N_Poblacion)*100||'%') AS Porcentaje_Recuperados
                INTO bandera, nombre_estado, poblacion, infectados, porcentaje_infectados, fallecidos, porcentaje_fallecidos, recuperados, porcentaje_recuperados
                FROM Lugar L, Lugar P
                WHERE L.ID = id_estado AND P.ID = L.FK_Lugar AND P.id=id_pais;
        ELSE IF ((pais IS NULL) AND (estado IS NOT NULL)) THEN
        OPEN cursore FOR
                SELECT P.Bandera, L.Nombre, P.N_Poblacion,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND (EP.FK_Estatus = 2 OR EP.FK_Estatus = 3 OR EP.FK_Estatus = 4)) AS Total_Infectados,
                (((SELECT COUNT (G.ID) FROM Persona G,Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND (EP.FK_Estatus = 2 OR EP.FK_Estatus = 3 OR EP.FK_Estatus = 4))/P.N_Poblacion)*100||'%') AS Porcentaje_Infectados,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 4) AS Total_Fallecidos,
                (((SELECT COUNT (G.ID) FROM Persona G,Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 4)/P.N_Poblacion)*100||'%') AS Porcentaje_Fallecidos,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 3) AS Total_Recuperados,
                (((SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 3)/P.N_Poblacion)*100||'%') AS Porcentaje_Recuperados
                INTO bandera, nombre_estado, poblacion, infectados, porcentaje_infectados, fallecidos, porcentaje_fallecidos, recuperados, porcentaje_recuperados
                FROM Lugar L, Lugar P
                WHERE L.ID = id_estado AND P.ID = L.FK_Lugar;
        ELSE IF ((pais IS NOT NULL) AND (estado IS NULL)) THEN
        OPEN cursore FOR
                SELECT P.Bandera, L.Nombre, P.N_Poblacion,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND (EP.FK_Estatus = 2 OR EP.FK_Estatus = 3 OR EP.FK_Estatus = 4)) AS Total_Infectados,
                (((SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND (EP.FK_Estatus = 2 OR EP.FK_Estatus = 3 OR EP.FK_Estatus = 4))/P.N_Poblacion)*100||'%') AS Porcentaje_Infectados,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 4) AS Total_Fallecidos,
                (((SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 4)/P.N_Poblacion)*100||'%') AS Porcentaje_Fallecidos,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 3) AS Total_Recuperados,
                (((SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 3)/P.N_Poblacion)*100||'%') AS Porcentaje_Recuperados
                INTO bandera, nombre_estado, poblacion, infectados, porcentaje_infectados, fallecidos, porcentaje_fallecidos, recuperados, porcentaje_recuperados
                FROM Lugar L, Lugar P
                WHERE L.FK_Lugar = P.ID AND P.ID = id_pais;
        ELSE IF ((pais IS  NULL) AND (estado IS NULL)) THEN
        OPEN cursore FOR
                SELECT P.Bandera, L.Nombre, P.N_Poblacion,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND (EP.FK_Estatus = 2 OR EP.FK_Estatus = 3 OR EP.FK_Estatus = 4)) AS Total_Infectados,
                (((SELECT COUNT (G.ID) FROM Persona G,Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND (EP.FK_Estatus = 2 OR EP.FK_Estatus = 3 OR EP.FK_Estatus = 4))/P.N_Poblacion)*100||'%') AS Porcentaje_Infectados,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 4) AS Total_Fallecidos,
                (((SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 4)/P.N_Poblacion)*100||'%') AS Porcentaje_Fallecidos,
                (SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 3) AS Total_Recuperados,
                (((SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = L.ID AND EP.FK_Persona = G.ID AND EP.FK_Estatus = 3)/P.N_Poblacion)*100||'%') AS Porcentaje_Recuperados
                INTO bandera, nombre_estado, poblacion, infectados, porcentaje_infectados, fallecidos, porcentaje_fallecidos, recuperados, porcentaje_recuperados
                FROM Lugar L, Lugar P
                WHERE L.FK_Lugar = P.ID;
        END IF;
        END IF;
        END IF;
        END IF;

END;


set autoprint on;
variable cursore refcursor;
execute Reporte4('Estados Unidos', 'California',:cursore);


                SELECT COUNT (G.ID) FROM Persona G, Estatus_Persona EP
                WHERE G.FK_Lugar = 16 AND EP.FK_Estatus = 2