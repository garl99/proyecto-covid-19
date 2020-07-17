create or replace procedure Reporte5(pais varchar2, modelo_pais varchar2, cursore out SYS_REFCURSOR) is

    Pais_modelo blob;
    Fecha_inicio date;
    Fecha_final  date;
    Modelo varchar(20);
    id_pais number;
    id_modelo number;

    Begin
        if ((pais is not null) and (modelo_pais is not null)) then
            Select l.id into id_pais from lugar l where l.nombre = pais;
            Select m.id into id_modelo from modelo m where m.nombre = modelo_pais;
            OPEN cursore FOR
            Select p.bandera Bandera, ml.rango_fecha.fecha_inicio Fecha_i, ml.rango_fecha.fecha_final Fecha_f , m.nombre Modelo_nombre
            Into Pais_modelo, Fecha_inicio, Fecha_final, Modelo
            From lugar p, modelo_lugar ml, modelo m 
            Where  (ml.fk_lugar = p.id) and (ml.fk_modelo = m.id) and (id_pais = p.id) and (id_modelo = m.id)
            order by ml.rango_fecha.fecha_inicio;
        else if ((pais is not null) and (modelo_pais is null)) then  
            Select l.id into id_pais from lugar l where l.nombre = pais;
            OPEN cursore FOR
            Select p.bandera Bandera, ml.rango_fecha.fecha_inicio Fecha_i, ml.rango_fecha.fecha_final Fecha_f , m.nombre Modelo_nombre
            Into Pais_modelo, Fecha_inicio, Fecha_final, Modelo
            From lugar p, modelo_lugar ml, modelo m 
            Where  (ml.fk_lugar = p.id) and (ml.fk_modelo = m.id) and (id_pais = p.id)
            order by ml.rango_fecha.fecha_inicio;
        else if ((pais is null) and (modelo_pais is not null)) then 
            Select m.id into id_modelo from modelo m where m.nombre = modelo_pais;
            OPEN cursore FOR
            Select p.bandera Bandera, ml.rango_fecha.fecha_inicio Fecha_i, ml.rango_fecha.fecha_final Fecha_f , m.nombre Modelo_nombre
            Into Pais_modelo, Fecha_inicio, Fecha_final, Modelo
            From lugar p, modelo_lugar ml, modelo m 
            Where  (ml.fk_lugar = p.id) and (ml.fk_modelo = m.id) and (id_modelo = m.id)
            order by ml.rango_fecha.fecha_inicio;  
        else if ((pais is null) and (modelo_pais is null)) then
            OPEN cursore FOR
            Select p.bandera Bandera, ml.rango_fecha.fecha_inicio Fecha_i, ml.rango_fecha.fecha_final Fecha_f , m.nombre Modelo_nombre
            Into Pais_modelo, Fecha_inicio, Fecha_final, Modelo
            From lugar p, modelo_lugar ml, modelo m 
            Where  (ml.fk_lugar = p.id) and  (ml.fk_modelo = m.id)
            order by ml.rango_fecha.fecha_inicio;
        end if;
        end if;
        end if;
        end if;
    End;
    
/*set autoprint on;
variable cursore refcursor;
execute Reporte5('España', 'Libre Movilidad' ,:cursore);*/
    
