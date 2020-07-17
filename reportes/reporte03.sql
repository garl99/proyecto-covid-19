create or replace procedure Reporte3(fecha_inicio date, fecha_fin date, cursore out SYS_REFCURSOR) is

    foto persona.foto%type;
    Primer_nombre persona.info_persona.primer_nombre%type;
    Segundo_nombre persona.info_persona.segundo_nombre%type;
    Primer_apellido persona.info_persona.primer_apellido%type;
    Segundo_apellido persona.info_persona.segundo_apellido%type;
    Edad number;
    Pais_residencia lugar.bandera%type;
    Pais_destino lugar.bandera%type;
    fecha_i date;
    fecha_f date;
    Viajes varchar(20);

    begin   

            if(to_date(fecha_inicio, 'DD/MM/YYYY')is not null and TO_DATE(fecha_fin, 'DD/MM/YYYY') is not null)  then
              if(fecha_inicio <= fecha_fin ) then
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id_pasajero = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id_pasajero = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id_pasajero = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id_pasajero = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id_pasajero = tabla.i) Segundo_apellido,
                (Select TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM persona p where p.id_pasajero = tabla.i) Edad,
                (Select l2.bandera from lugar l, lugar l2 where l.id=tabla.lu and l2.id = l.fk_lugar) Pais_residencia,
                (Select l2.bandera from lugar l, lugar l2 where l.id=tabla.vi and l2.id = l.fk_lugar) Pais_destino,
                fecha_inicio,
                fecha_fin,
                tabla.Viajes Viajes

                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, Edad, Pais_residencia, Pais_destino, fecha_i, fecha_f, Viajes
                From (Select p.id_pasajero i, p.fk_lugar lu, v.fk_destino vi, LISTAGG(l.nombre, ', ') within Group (order by l.fk_lugar) Viajes
                    from persona p, lugar l, viaje v, estatus_persona ep
                    where v.fk_pasajero = p.id_pasajero and v.fk_destino = l.id and p.tipo = 'pasajero'
                    and ep.fk_estatus = 2 and ep.fk_persona = p.id 
                    and to_date(v.fecha_inicio, 'DD/MM/YYYY') between to_date(fecha_inicio, 'DD/MM/YYYY') and to_date(fecha_fin, 'DD/MM/YYYY')
                    GROUP BY p.id_pasajero,  p.fk_lugar, v.fk_destino) tabla;

              else  
                raise_application_error(-20000,'Error en los parametros. La fecha de inicio es mayor a la fecha inicial');
              end if;

            else if (to_date(fecha_inicio, 'DD/MM/YYYY') is null and to_date(fecha_fin, 'DD/MM/YYYY') is not null) then 
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id_pasajero = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id_pasajero = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id_pasajero = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id_pasajero = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id_pasajero = tabla.i) Segundo_apellido,
                (Select TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM persona p where p.id_pasajero = tabla.i) Edad,
                (Select l2.bandera from lugar l, lugar l2 where l.id=tabla.lu and l2.id = l.fk_lugar) Pais_residencia,
                (Select l2.bandera from lugar l, lugar l2 where l.id=tabla.vi and l2.id = l.fk_lugar) Pais_destino,
                fecha_inicio,
                fecha_fin,
                tabla.Viajes Viajes

                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, Edad, Pais_residencia, Pais_destino, fecha_i, fecha_f, Viajes
                From (Select p.id_pasajero i, p.fk_lugar lu, v.fk_destino vi, LISTAGG(l.nombre, ', ') within Group (order by l.fk_lugar) Viajes
                    from persona p, lugar l, viaje v, estatus_persona ep
                    where v.fk_pasajero = p.id_pasajero and v.fk_destino = l.id and p.tipo = 'pasajero'
                    and ep.fk_estatus = 2 and ep.fk_persona = p.id 
                    and to_date(v.fecha_inicio, 'DD/MM/YYYY') <= to_date(fecha_fin, 'DD/MM/YYYY')
                    GROUP BY p.id_pasajero,  p.fk_lugar, v.fk_destino) tabla;   
                    
            else if (to_date(fecha_inicio, 'DD/MM/YYYY') is not null and to_date(fecha_fin, 'DD/MM/YYYY') is null) then 
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id_pasajero = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id_pasajero = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id_pasajero = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id_pasajero = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id_pasajero = tabla.i) Segundo_apellido,
                (Select TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM persona p where p.id_pasajero = tabla.i) Edad,
                (Select l2.bandera from lugar l, lugar l2 where l.id=tabla.lu and l2.id = l.fk_lugar) Pais_residencia,
                (Select l2.bandera from lugar l, lugar l2 where l.id=tabla.vi and l2.id = l.fk_lugar) Pais_destino,
                fecha_inicio,
                fecha_fin,
                tabla.Viajes Viajes

                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, Edad, Pais_residencia, Pais_destino, fecha_i, fecha_f, Viajes
                From (Select p.id_pasajero i, p.fk_lugar lu, v.fk_destino vi, LISTAGG(l.nombre, ', ') within Group (order by l.fk_lugar) Viajes
                    from persona p, lugar l, viaje v, estatus_persona ep
                    where v.fk_pasajero = p.id_pasajero and v.fk_destino = l.id and p.tipo = 'pasajero'
                    and ep.fk_estatus = 2 and ep.fk_persona = p.id 
                    and to_date(v.fecha_inicio, 'DD/MM/YYYY') >= to_date(fecha_inicio, 'DD/MM/YYYY')
                    GROUP BY p.id_pasajero,  p.fk_lugar, v.fk_destino) tabla;   
            
            else if (to_date(fecha_inicio, 'DD/MM/YYYY') is null and to_date(fecha_fin, 'DD/MM/YYYY') is null) then  
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id_pasajero = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id_pasajero = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id_pasajero = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id_pasajero = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id_pasajero = tabla.i) Segundo_apellido,
                (Select TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM persona p where p.id_pasajero = tabla.i) Edad,
                (Select l2.bandera from lugar l, lugar l2 where l.id=tabla.lu and l2.id = l.fk_lugar) Pais_residencia,
                (Select l2.bandera from lugar l, lugar l2 where l.id=tabla.vi and l2.id = l.fk_lugar) Pais_destino,
                fecha_inicio,
                fecha_fin,
                tabla.Viajes Viajes

                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, Edad, Pais_residencia, Pais_destino, fecha_i, fecha_f, Viajes
                From (Select p.id_pasajero i, p.fk_lugar lu, v.fk_destino vi, LISTAGG(l.nombre, ', ') within Group (order by l.fk_lugar) Viajes
                    from persona p, lugar l, viaje v, estatus_persona ep
                    where v.fk_pasajero = p.id_pasajero and v.fk_destino = l.id and p.tipo = 'pasajero'
                    and ep.fk_estatus = 2 and ep.fk_persona = p.id 
                    GROUP BY p.id_pasajero,  p.fk_lugar, v.fk_destino) tabla; 
                
            end if;
            end if;
            end if;         
            end if;
    end;
    
    set autoprint on;
variable cursore refcursor;
execute Reporte3('1/06/2020', null, :cursore);


           