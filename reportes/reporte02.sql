CREATE OR REPLACE PROCEDURE Reporte2(pais varchar2, estado varchar2, edad number, cursore out SYS_REFCURSOR) 
IS
    id_persona persona.id%type;
    foto persona.foto%type;
    primer_nombre persona.info_persona.primer_nombre%type;
    segundo_nombre persona.info_persona.segundo_nombre%type;
    primer_apellido persona.info_persona.primer_apellido%type;
    segundo_apellido persona.info_persona.segundo_apellido%type;
    persona_edad number;
    pais_bandera lugar.bandera%type;
    genero persona.info_persona.genero%type;
    nombre_estado lugar.nombre%type;
    patologias varchar(100);
    sintomas varchar(100);
    fecha_sintoma date;
    id_estado lugar.id%type;
    id_pais lugar.id%type;
    atencion_medica varchar(2);
    
BEGIN
    IF (pais IS NOT NULL) THEN      
        SELECT ID INTO id_pais FROM Lugar WHERE Nombre = pais AND Tipo = 'pais';
    END IF;
    IF (estado IS NOT NULL) THEN
        SELECT ID INTO id_estado FROM Lugar WHERE Nombre = estado AND Tipo = 'estado'; 
    END IF;
    IF ((pais IS NOT NULL) AND (estado IS NOT NULL) AND (edad IS NOT NULL)) THEN
        OPEN cursore FOR
        SELECT P.ID, P.Foto, P.Info_Persona.Primer_Nombre, P.Info_Persona.Segundo_Nombre, P.Info_Persona.Primer_Apellido, P.Info_Persona.Segundo_Apellido,
            TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) AS Edad,
            (SELECT Bandera FROM Lugar WHERE ID = (SELECT FK_Lugar FROM Lugar WHERE ID = P.FK_Lugar) AND Tipo = 'pais') AS Pais,
            P.Info_Persona.Genero, (SELECT Nombre FROM Lugar WHERE ID = P.FK_Lugar) AS Estado,
            '['||(SELECT LISTAGG(PA.Nombre,', ') WITHIN GROUP (ORDER BY P.ID) FROM Patologia PA, Patologia_Persona PP
            WHERE PP.FK_Persona = P.ID AND PP.FK_Patologia = PA.ID GROUP BY P.ID)||']' AS Patologia,
            '['||(SELECT LISTAGG(S.Nombre,', ') WITHIN GROUP(ORDER BY P.ID) FROM Sintoma S, Sintoma_Persona SP
            WHERE SP.FK_Persona = P.ID AND SP.FK_Sintoma = S.ID GROUP BY P.ID)||']' AS Sintoma,
            (SELECT SP.Fecha_Sintoma FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Fecha_Sintoma,
            (SELECT SP.Atencion_Medica FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Atencion
        INTO id_persona, foto, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, persona_edad, pais_bandera, 
            genero, nombre_estado, patologias, sintomas,fecha_sintoma, atencion_medica
        FROM Persona P, Estatus_Persona EP
        WHERE EP.FK_Persona = P.ID AND EP.FK_Estatus = 1
            AND P.FK_Lugar = id_estado 
            AND (SELECT FK_Lugar FROM Lugar WHERE ID = id_estado) = id_pais
            AND TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) = edad;

    ELSE IF ((pais IS NOT NULL) AND (estado IS NOT NULL) AND (edad IS NULL)) THEN
        OPEN cursore FOR
        SELECT P.ID, P.Foto, P.Info_Persona.Primer_Nombre, P.Info_Persona.Segundo_Nombre, P.Info_Persona.Primer_Apellido, P.Info_Persona.Segundo_Apellido,
            TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) AS Edad,
            (SELECT Bandera FROM Lugar WHERE ID = (SELECT FK_Lugar FROM Lugar WHERE ID = P.FK_Lugar) AND Tipo = 'pais') AS Pais,
            P.Info_Persona.Genero, (SELECT Nombre FROM Lugar WHERE ID = P.FK_Lugar) AS Estado,
            '['||(SELECT LISTAGG(PA.Nombre,', ') WITHIN GROUP (ORDER BY P.ID) FROM Patologia PA, Patologia_Persona PP
            WHERE PP.FK_Persona = P.ID AND PP.FK_Patologia = PA.ID GROUP BY P.ID)||']' AS Patologia,
            '['||(SELECT LISTAGG(S.Nombre,', ') WITHIN GROUP(ORDER BY P.ID) FROM Sintoma S, Sintoma_Persona SP
            WHERE SP.FK_Persona = P.ID AND SP.FK_Sintoma = S.ID GROUP BY P.ID)||']' AS Sintoma,
            (SELECT SP.Fecha_Sintoma FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Fecha_Sintoma,
            (SELECT SP.Atencion_Medica FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Atencion
        INTO id_persona, foto, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, persona_edad, pais_bandera, 
            genero, nombre_estado, patologias, sintomas,fecha_sintoma, atencion_medica
        FROM Persona P, Estatus_Persona EP
        WHERE EP.FK_Persona = P.ID AND EP.FK_Estatus = 1
            AND P.FK_Lugar = id_estado 
            AND (SELECT FK_Lugar FROM Lugar WHERE ID = id_estado) = id_pais;

       
    ELSE IF ((pais IS NOT NULL) AND (estado IS  NULL) AND (edad IS NULL)) THEN  

        OPEN cursore FOR
        SELECT P.ID, P.Foto, P.Info_Persona.Primer_Nombre, P.Info_Persona.Segundo_Nombre, P.Info_Persona.Primer_Apellido, P.Info_Persona.Segundo_Apellido,
            TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) AS Edad,
            (SELECT Bandera FROM Lugar WHERE ID = (SELECT FK_Lugar FROM Lugar WHERE ID = P.FK_Lugar) AND Tipo = 'pais') AS Pais,
            P.Info_Persona.Genero, (SELECT Nombre FROM Lugar WHERE ID = P.FK_Lugar) AS Estado,
            '['||(SELECT LISTAGG(PA.Nombre,', ') WITHIN GROUP (ORDER BY P.ID) FROM Patologia PA, Patologia_Persona PP
            WHERE PP.FK_Persona = P.ID AND PP.FK_Patologia = PA.ID GROUP BY P.ID)||']' AS Patologia,
            '['||(SELECT LISTAGG(S.Nombre,', ') WITHIN GROUP(ORDER BY P.ID) FROM Sintoma S, Sintoma_Persona SP
            WHERE SP.FK_Persona = P.ID AND SP.FK_Sintoma = S.ID GROUP BY P.ID)||']' AS Sintoma,
            (SELECT SP.Fecha_Sintoma FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Fecha_Sintoma,
            (SELECT SP.Atencion_Medica FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Atencion
        INTO id_persona, foto, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, persona_edad, pais_bandera, 
            genero, nombre_estado, patologias, sintomas,fecha_sintoma, atencion_medica
        FROM Persona P, Estatus_Persona EP
        WHERE EP.FK_Persona = P.ID AND EP.FK_Estatus = 1 AND P.FK_Lugar IN (SELECT ID FROM Lugar WHERE FK_Lugar = id_pais);
 
    ELSE IF ((pais IS NULL) AND (estado IS NOT NULL) AND (edad IS NOT NULL)) THEN
        OPEN cursore FOR
        SELECT P.ID, P.Foto, P.Info_Persona.Primer_Nombre, P.Info_Persona.Segundo_Nombre, P.Info_Persona.Primer_Apellido, P.Info_Persona.Segundo_Apellido,
            TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) AS Edad,
            (SELECT Bandera FROM Lugar WHERE ID = (SELECT FK_Lugar FROM Lugar WHERE ID = P.FK_Lugar) AND Tipo = 'pais') AS Pais,
            P.Info_Persona.Genero, (SELECT Nombre FROM Lugar WHERE ID = P.FK_Lugar) AS Estado,
            '['||(SELECT LISTAGG(PA.Nombre,', ') WITHIN GROUP (ORDER BY P.ID) FROM Patologia PA, Patologia_Persona PP
            WHERE PP.FK_Persona = P.ID AND PP.FK_Patologia = PA.ID GROUP BY P.ID)||']' AS Patologia,
            '['||(SELECT LISTAGG(S.Nombre,', ') WITHIN GROUP(ORDER BY P.ID) FROM Sintoma S, Sintoma_Persona SP
            WHERE SP.FK_Persona = P.ID AND SP.FK_Sintoma = S.ID GROUP BY P.ID)||']' AS Sintoma,
            (SELECT SP.Fecha_Sintoma FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Fecha_Sintoma,
            (SELECT SP.Atencion_Medica FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Atencion
        INTO id_persona, foto, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, persona_edad, pais_bandera, 
            genero, nombre_estado, patologias, sintomas,fecha_sintoma, atencion_medica
        FROM Persona P, Estatus_Persona EP
        WHERE EP.FK_Persona = P.ID AND EP.FK_Estatus = 1
            AND P.FK_Lugar = id_estado 
            AND TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) = edad;
 

    ELSE IF ((pais IS  NULL) AND (estado IS NOT NULL) AND (edad IS  NULL)) THEN
        OPEN cursore FOR
        SELECT P.ID, P.Foto, P.Info_Persona.Primer_Nombre, P.Info_Persona.Segundo_Nombre, P.Info_Persona.Primer_Apellido, P.Info_Persona.Segundo_Apellido,
            TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) AS Edad,
            (SELECT Bandera FROM Lugar WHERE ID = (SELECT FK_Lugar FROM Lugar WHERE ID = P.FK_Lugar) AND Tipo = 'pais') AS Pais,
            P.Info_Persona.Genero, (SELECT Nombre FROM Lugar WHERE ID = P.FK_Lugar) AS Estado,
            '['||(SELECT LISTAGG(PA.Nombre,', ') WITHIN GROUP (ORDER BY P.ID) FROM Patologia PA, Patologia_Persona PP
            WHERE PP.FK_Persona = P.ID AND PP.FK_Patologia = PA.ID GROUP BY P.ID)||']' AS Patologia,
            '['||(SELECT LISTAGG(S.Nombre,', ') WITHIN GROUP(ORDER BY P.ID) FROM Sintoma S, Sintoma_Persona SP
            WHERE SP.FK_Persona = P.ID AND SP.FK_Sintoma = S.ID GROUP BY P.ID)||']' AS Sintoma,
            (SELECT SP.Fecha_Sintoma FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Fecha_Sintoma,
            (SELECT SP.Atencion_Medica FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Atencion
        INTO id_persona, foto, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, persona_edad, pais_bandera, 
            genero, nombre_estado, patologias, sintomas,fecha_sintoma, atencion_medica
        FROM Persona P, Estatus_Persona EP
        WHERE EP.FK_Persona = P.ID AND EP.FK_Estatus = 1 AND P.FK_Lugar = id_estado;
  
      
    ELSE IF ((pais IS NULL) AND (estado IS NULL) AND (edad IS NOT NULL)) THEN 
        OPEN cursore FOR
        SELECT P.ID, P.Foto, P.Info_Persona.Primer_Nombre, P.Info_Persona.Segundo_Nombre, P.Info_Persona.Primer_Apellido, P.Info_Persona.Segundo_Apellido,
            TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) AS Edad,
            (SELECT Bandera FROM Lugar WHERE ID = (SELECT FK_Lugar FROM Lugar WHERE ID = P.FK_Lugar) AND Tipo = 'pais') AS Pais,
            P.Info_Persona.Genero, (SELECT Nombre FROM Lugar WHERE ID = P.FK_Lugar) AS Estado,
            '['||(SELECT LISTAGG(PA.Nombre,', ') WITHIN GROUP (ORDER BY P.ID) FROM Patologia PA, Patologia_Persona PP
            WHERE PP.FK_Persona = P.ID AND PP.FK_Patologia = PA.ID GROUP BY P.ID)||']' AS Patologia,
            '['||(SELECT LISTAGG(S.Nombre,', ') WITHIN GROUP(ORDER BY P.ID) FROM Sintoma S, Sintoma_Persona SP
            WHERE SP.FK_Persona = P.ID AND SP.FK_Sintoma = S.ID GROUP BY P.ID)||']' AS Sintoma,
            (SELECT SP.Fecha_Sintoma FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Fecha_Sintoma,
            (SELECT SP.Atencion_Medica FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Atencion
        INTO id_persona, foto, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, persona_edad, pais_bandera, 
            genero, nombre_estado, patologias, sintomas,fecha_sintoma, atencion_medica
        FROM Persona P, Estatus_Persona EP
        WHERE EP.FK_Persona = P.ID AND EP.FK_Estatus = 1
            AND TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) = edad;
   
        
            
    ELSE IF ((pais IS NOT NULL) AND (estado IS NULL) AND (edad IS NOT NULL)) THEN  
        OPEN cursore FOR
        SELECT P.ID, P.Foto, P.Info_Persona.Primer_Nombre, P.Info_Persona.Segundo_Nombre, P.Info_Persona.Primer_Apellido, P.Info_Persona.Segundo_Apellido,
            TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) AS Edad,
            (SELECT Bandera FROM Lugar WHERE ID = (SELECT FK_Lugar FROM Lugar WHERE ID = P.FK_Lugar) AND Tipo = 'pais') AS Pais,
            P.Info_Persona.Genero, (SELECT Nombre FROM Lugar WHERE ID = P.FK_Lugar) AS Estado,
            '['||(SELECT LISTAGG(PA.Nombre,', ') WITHIN GROUP (ORDER BY P.ID) FROM Patologia PA, Patologia_Persona PP
            WHERE PP.FK_Persona = P.ID AND PP.FK_Patologia = PA.ID GROUP BY P.ID)||']' AS Patologia,
            '['||(SELECT LISTAGG(S.Nombre,', ') WITHIN GROUP(ORDER BY P.ID) FROM Sintoma S, Sintoma_Persona SP
            WHERE SP.FK_Persona = P.ID AND SP.FK_Sintoma = S.ID GROUP BY P.ID)||']' AS Sintoma,
            (SELECT SP.Fecha_Sintoma FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Fecha_Sintoma,
            (SELECT SP.Atencion_Medica FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Atencion
        INTO id_persona, foto, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, persona_edad, pais_bandera, 
            genero, nombre_estado, patologias, sintomas,fecha_sintoma, atencion_medica
        FROM Persona P, Estatus_Persona EP
        WHERE EP.FK_Persona = P.ID AND EP.FK_Estatus = 1
            AND P.FK_Lugar IN (SELECT ID FROM Lugar WHERE FK_Lugar = id_pais)
            AND TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) = edad;

        
    ELSE IF ((pais IS  NULL) AND (estado IS NULL) AND (edad IS NULL)) THEN
        OPEN cursore FOR
        SELECT P.ID, P.Foto, P.Info_Persona.Primer_Nombre, P.Info_Persona.Segundo_Nombre, P.Info_Persona.Primer_Apellido, P.Info_Persona.Segundo_Apellido,
            TRUNC((MONTHS_BETWEEN(sysdate,P.Info_Persona.Fecha_Nacimiento))/12) AS Edad,
            (SELECT Bandera FROM Lugar WHERE ID = (SELECT FK_Lugar FROM Lugar WHERE ID = P.FK_Lugar) AND Tipo = 'pais') AS Pais,
            P.Info_Persona.Genero, (SELECT Nombre FROM Lugar WHERE ID = P.FK_Lugar) AS Estado,
            '['||(SELECT LISTAGG(PA.Nombre,', ') WITHIN GROUP (ORDER BY P.ID) FROM Patologia PA, Patologia_Persona PP
            WHERE PP.FK_Persona = P.ID AND PP.FK_Patologia = PA.ID GROUP BY P.ID)||']' AS Patologia,
            '['||(SELECT LISTAGG(S.Nombre,', ') WITHIN GROUP(ORDER BY P.ID) FROM Sintoma S, Sintoma_Persona SP
            WHERE SP.FK_Persona = P.ID AND SP.FK_Sintoma = S.ID GROUP BY P.ID)||']' AS Sintoma,
            (SELECT SP.Fecha_Sintoma FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Fecha_Sintoma,
            (SELECT SP.Atencion_Medica FROM Sintoma_Persona SP WHERE SP.FK_Persona = P.ID AND ROWNUM = 1) AS Atencion
        INTO id_persona, foto, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, persona_edad, pais_bandera, 
            genero, nombre_estado, patologias, sintomas,fecha_sintoma, atencion_medica
        FROM Persona P, Estatus_Persona EP
        WHERE EP.FK_Persona = P.ID AND EP.FK_Estatus = 1;
            
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
execute Reporte2('Estados Unidos', 'California', 46,:cursore);


