/*-------------------------------------Reporte 7------------------------------------*/
create or replace procedure Reporte07(pais varchar2, fecha_i date, fecha_f date, cursore out SYS_REFCURSOR) is
    


    id_pais lugar.id%type;

    begin   
        if((pais is not null) and (fecha_i is not null) and (fecha_f is not null) ) then
            Select id into id_pais from lugar where nombre = pais;
            OPEN cursore FOR
            select 
            a.logo as logo,
            'V-'||v.id as n_vuelo , 
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_origen) as bandera_o,
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_destino) as bandera_d,
            (select u.nombre from lugar u where u.id=v.fk_origen) as estado_o,
            (select u.nombre from lugar u where u.id=v.fk_destino) as estado_d,
            fecha_i as fecha_i,
            fecha_f as fecha_f,
            p.id_pasajero as id_pasajero,
            p.foto as foto,
            p.info_persona.primer_nombre as primer_nombre,
            p.info_persona.segundo_nombre as segundo_nombre,
            p.info_persona.primer_apellido as primer_apellido,
            p.info_persona.segundo_apellido as segundo_apellido

            from viaje v, aerolinea a, avion o, persona p
            where v.fk_avion=o.id and o.fk_aerolinea=a.nombre and TO_DATE(fecha_inicio,'DD/MM/YYYY')BETWEEN 
            TO_DATE(TO_DATE(fecha_i),'DD/MM/YYYY') and TO_DATE(TO_DATE(fecha_f),'DD/MM/YYYY') and
            p.id_pasajero=v.fk_pasajero and id_pais=(select u.fk_lugar from lugar u where u.id=v.fk_destino);  
        
        else  if((pais is null) and (fecha_i is not null) and (fecha_f is not null) ) then
            OPEN cursore FOR
            select 
            a.logo as logo,
            'V-'||v.id as n_vuelo , 
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_origen) as bandera_o,
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_destino) as bandera_d,
            (select u.nombre from lugar u where u.id=v.fk_origen) as estado_o,
            (select u.nombre from lugar u where u.id=v.fk_destino) as estado_d,
            fecha_i as fecha_i,
            fecha_f as fecha_f,
            p.id_pasajero as id_pasajero,
            p.foto as foto,
            p.info_persona.primer_nombre as primer_nombre,
            p.info_persona.segundo_nombre as segundo_nombre,
            p.info_persona.primer_apellido as primer_apellido,
            p.info_persona.segundo_apellido as segundo_apellido

            from viaje v, aerolinea a, avion o, persona p
            where v.fk_avion=o.id and o.fk_aerolinea=a.nombre and TO_DATE(fecha_inicio,'DD/MM/YYYY')BETWEEN 
            TO_DATE(TO_DATE(fecha_i),'DD/MM/YYYY') and TO_DATE(TO_DATE(fecha_f),'DD/MM/YYYY') and
            p.id_pasajero=v.fk_pasajero;  

         else  if((pais is null) and (fecha_i is null) and (fecha_f is not null) ) then
            OPEN cursore FOR
            select 
            a.logo as logo,
            'V-'||v.id as n_vuelo , 
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_origen) as bandera_o,
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_destino) as bandera_d,
            (select u.nombre from lugar u where u.id=v.fk_origen) as estado_o,
            (select u.nombre from lugar u where u.id=v.fk_destino) as estado_d,
            'N/A' as fecha_i,
            fecha_f as fecha_f,
            p.id_pasajero as id_pasajero,
            p.foto as foto,
            p.info_persona.primer_nombre as primer_nombre,
            p.info_persona.segundo_nombre as segundo_nombre,
            p.info_persona.primer_apellido as primer_apellido,
            p.info_persona.segundo_apellido as segundo_apellido

            from viaje v, aerolinea a, avion o, persona p
            where v.fk_avion=o.id and o.fk_aerolinea=a.nombre and 
            TO_DATE(fecha_inicio,'DD/MM/YYYY')= TO_DATE(TO_DATE(fecha_f),'DD/MM/YYYY') and
            p.id_pasajero=v.fk_pasajero;  
        
         else if((pais is null) and (fecha_i is not null) and (fecha_f is null) ) then
            OPEN cursore FOR
            select 
            a.logo as logo,
            'V-'||v.id as n_vuelo , 
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_origen) as bandera_o,
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_destino) as bandera_d,
            (select u.nombre from lugar u where u.id=v.fk_origen) as estado_o,
            (select u.nombre from lugar u where u.id=v.fk_destino) as estado_d,
            fecha_i as fecha_i,
            'N/A' as fecha_f,
            p.id_pasajero as id_pasajero,
            p.foto as foto,
            p.info_persona.primer_nombre as primer_nombre,
            p.info_persona.segundo_nombre as segundo_nombre,
            p.info_persona.primer_apellido as primer_apellido,
            p.info_persona.segundo_apellido as segundo_apellido

            from viaje v, aerolinea a, avion o, persona p
            where v.fk_avion=o.id and o.fk_aerolinea=a.nombre and 
            TO_DATE(fecha_inicio,'DD/MM/YYYY')= TO_DATE(TO_DATE(fecha_i),'DD/MM/YYYY') and
            p.id_pasajero=v.fk_pasajero;  
        
         else if((pais is not null) and (fecha_i is not null) and (fecha_f is null) ) then
            Select id into id_pais from lugar where nombre = pais;
            OPEN cursore FOR
            select 
            a.logo as logo,
            'V-'||v.id as n_vuelo , 
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_origen) as bandera_o,
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_destino) as bandera_d,
            (select u.nombre from lugar u where u.id=v.fk_origen) as estado_o,
            (select u.nombre from lugar u where u.id=v.fk_destino) as estado_d,
            fecha_i as fecha_i,
            'N/A' as fecha_f,
            p.id_pasajero as id_pasajero,
            p.foto as foto,
            p.info_persona.primer_nombre as primer_nombre,
            p.info_persona.segundo_nombre as segundo_nombre,
            p.info_persona.primer_apellido as primer_apellido,
            p.info_persona.segundo_apellido as segundo_apellido

            from viaje v, aerolinea a, avion o, persona p
            where v.fk_avion=o.id and o.fk_aerolinea=a.nombre and 
            TO_DATE(fecha_inicio,'DD/MM/YYYY')= TO_DATE(TO_DATE(fecha_i),'DD/MM/YYYY') and
            p.id_pasajero=v.fk_pasajero and id_pais=(select u.fk_lugar from lugar u where u.id=v.fk_destino); 
        
        
        else if((pais is not null) and (fecha_i is null) and (fecha_f is not null) ) then
            Select id into id_pais from lugar where nombre = pais;
            OPEN cursore FOR
            select 
            a.logo as logo,
            'V-'||v.id as n_vuelo , 
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_origen) as bandera_o,
            (select u.bandera from lugar l, lugar u where l.fk_lugar=u.id and l.id=v.fk_destino) as bandera_d,
            (select u.nombre from lugar u where u.id=v.fk_origen) as estado_o,
            (select u.nombre from lugar u where u.id=v.fk_destino) as estado_d,
            'N/A' as fecha_i,
            fecha_f as fecha_f,
            p.id_pasajero as id_pasajero,
            p.foto as foto,
            p.info_persona.primer_nombre as primer_nombre,
            p.info_persona.segundo_nombre as segundo_nombre,
            p.info_persona.primer_apellido as primer_apellido,
            p.info_persona.segundo_apellido as segundo_apellido

            from viaje v, aerolinea a, avion o, persona p
            where v.fk_avion=o.id and o.fk_aerolinea=a.nombre and 
            TO_DATE(fecha_inicio,'DD/MM/YYYY')= TO_DATE(TO_DATE(fecha_f),'DD/MM/YYYY') and
            p.id_pasajero=v.fk_pasajero and id_pais=(select u.fk_lugar from lugar u where u.id=v.fk_destino); 
        
        end if;
        end if;
        end if;
        end if;
        end if;
        end if;
    end;

set autoprint on;
variable cursore refcursor;
execute Reporte07('Estados Unidos','27/05/2020', '28/05/2020',:cursore);

set autoprint on;
variable cursore refcursor;
execute Reporte07(null,'30/05/2020', '31/05/2020',:cursore);

