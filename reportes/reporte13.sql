            
/*-------------------------------------Reporte 13------------------------------------*/
create or replace procedure Reporte13(pais varchar2, fecha_inicio date, fecha_final date, cursore out SYS_REFCURSOR) is
    

    bandera lugar.bandera%type;
    id_pais lugar.id%type;
    fecha_i date;
    fecha_f date;

    begin   
        
        if((pais is not null) and (fecha_inicio is not null) and (fecha_final is not null) ) then
                Select id into id_pais from lugar where nombre = pais;
                OPEN cursore FOR
                select l.bandera,f.rango_fecha.fecha_inicio,f.rango_fecha.fecha_final 
                into bandera,fecha_i,fecha_f
                from frontera f, lugar l
                where f.fk_lugar=l.id and f.rango_fecha.fecha_inicio=fecha_inicio and 
                f.rango_fecha.fecha_final=fecha_final and l.id=id_pais;

        else if((pais is null) and (fecha_inicio is not null) and (fecha_final is not null))then
                 OPEN cursore FOR
                 select l.bandera,f.rango_fecha.fecha_inicio,f.rango_fecha.fecha_final 
                 into bandera,fecha_i,fecha_f
                 from frontera f, lugar l
                 where f.fk_lugar=l.id and f.rango_fecha.fecha_inicio=fecha_inicio and 
                 f.rango_fecha.fecha_final=fecha_final;

        else if((pais is null) and (fecha_inicio is not null) and (fecha_final is null))then
                 OPEN cursore FOR
                 select l.bandera,f.rango_fecha.fecha_inicio,f.rango_fecha.fecha_final 
                 into bandera,fecha_i,fecha_f
                 from frontera f, lugar l
                 where f.fk_lugar=l.id and f.rango_fecha.fecha_inicio=fecha_inicio;

        else if((pais is null) and (fecha_inicio is null) and (fecha_final is not null))then
                 OPEN cursore FOR
                 select l.bandera,f.rango_fecha.fecha_inicio,f.rango_fecha.fecha_final 
                 into bandera,fecha_i,fecha_f
                 from frontera f, lugar l
                 where f.fk_lugar=l.id and f.rango_fecha.fecha_final=fecha_final;

        else if((pais is not null) and (fecha_inicio is null) and (fecha_final is null))then
                 Select id into id_pais from lugar where nombre = pais;
                 OPEN cursore FOR
                 select l.bandera,f.rango_fecha.fecha_inicio,f.rango_fecha.fecha_final 
                 into bandera,fecha_i,fecha_f
                 from frontera f, lugar l
                 where f.fk_lugar=l.id and l.id=id_pais;
        else if((pais is not null) and (fecha_inicio is not null) and (fecha_final is null))then
                Select id into id_pais from lugar where nombre = pais;
                 OPEN cursore FOR
                 select l.bandera,f.rango_fecha.fecha_inicio,f.rango_fecha.fecha_final 
                 into bandera,fecha_i,fecha_f
                 from frontera f, lugar l
                 where f.fk_lugar=l.id and f.rango_fecha.fecha_inicio=fecha_inicio and l.id=id_pais;

        else if((pais is not null) and (fecha_inicio is null) and (fecha_final is not null))then
                 Select id into id_pais from lugar where nombre = pais;
                 OPEN cursore FOR
                 select l.bandera,f.rango_fecha.fecha_inicio,f.rango_fecha.fecha_final 
                 into bandera,fecha_i,fecha_f
                 from frontera f, lugar l
                 where f.fk_lugar=l.id and f.rango_fecha.fecha_final=fecha_final and l.id=id_pais;
        end if;
        end if;
        end if;
        end if;
        end if;
        end if;
        end if;

    end;


set autoprint on;
variable cursore refcursor;
execute Reporte13(null,'19/06/2020', '01/07/2020',:cursore);

set autoprint on;
variable cursore refcursor;
execute Reporte13('Brasil','10/06/2020', '24/06/2020',:cursore);