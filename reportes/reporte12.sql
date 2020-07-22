            
/*-------------------------------------Reporte 12------------------------------------*/
create or replace procedure Reporte12(pais varchar2, fecha_a date, cursore out SYS_REFCURSOR) is
    

    bandera lugar.bandera%type;
    logo proveedor_internet.logo%type;
    id_pais lugar.id%type;
    fecha_b date;

    begin   
        if((pais is not null) and (fecha_a is not null)) then
                select id into id_pais from lugar where nombre = pais;
                OPEN cursore FOR
                select l.bandera as bandera, p.logo as logo, TO_DATE(lp.fecha,'DD/MM/YYYY') as fecha, lp.velocidad_subida||' MB' as velocidad_subida, lp.velocidad_bajada||' MB' as velocidad_bajada, lp.horas_interrupcion||' Horas' as horas_interrupcion
                from lugar l, lugar_proveedor lp, proveedor_internet p 
                where lp.fk_lugar=l.id and lp.fk_proveedor=p.id and l.id=id_pais and TO_DATE(fecha,'DD/MM/YYYY')=TO_DATE(fecha_a,'DD/MM/YYYY');

        else if((pais is null) and (fecha_a is not null)) then
                OPEN cursore FOR
                select l.bandera as bandera, p.logo as logo, TO_DATE(lp.fecha,'DD/MM/YYYY') as fecha, lp.velocidad_subida||' MB' as velocidad_subida, lp.velocidad_bajada||' MB' as velocidad_bajada, lp.horas_interrupcion||' Horas' as horas_interrupcion
                from lugar l, lugar_proveedor lp, proveedor_internet p 
                where lp.fk_lugar=l.id and lp.fk_proveedor=p.id and TO_DATE(fecha,'DD/MM/YYYY')=TO_DATE(fecha_a,'DD/MM/YYYY');

        else if((pais is not null) and (fecha_a is null)) then
                select id into id_pais from lugar where nombre = pais;
                OPEN cursore FOR
                select l.bandera as bandera, p.logo as logo, TO_DATE(lp.fecha,'DD/MM/YYYY') as fecha, lp.velocidad_subida||' MB' as velocidad_subida, lp.velocidad_bajada||' MB' as velocidad_bajada, lp.horas_interrupcion||' Horas' as horas_interrupcion
                from lugar l, lugar_proveedor lp, proveedor_internet p 
                where lp.fk_lugar=l.id and lp.fk_proveedor=p.id and l.id=id_pais;

        else if((pais is null) and (fecha_a is null)) then

                OPEN cursore FOR
                select l.bandera as bandera, p.logo as logo, TO_DATE(lp.fecha,'DD/MM/YYYY') as fecha, lp.velocidad_subida||' MB' as velocidad_subida, lp.velocidad_bajada||' MB' as velocidad_bajada, lp.horas_interrupcion||' Horas' as horas_interrupcion
                from lugar l, lugar_proveedor lp, proveedor_internet p 
                where lp.fk_lugar=l.id and lp.fk_proveedor=p.id;
        end if;
        end if;
        end if;
        end if;


    end;

set autoprint on;
variable cursore refcursor;
execute Reporte12('Francia','29/05/2020',:cursore);

set autoprint on;
variable cursore refcursor;
execute Reporte12('Reino Unido',null,:cursore);

set autoprint on;
variable cursore refcursor;
execute Reporte12(null,'22/06/2020',:cursore);