

-----------------------------------Con 4 paramatros (el correcto)------------------------------------------
create or replace procedure Reporte1(pais varchar2, estado varchar2,  presencia_patologica varchar2, edad number, cursore out SYS_REFCURSOR) is

    foto persona.foto%type;
    Primer_nombre persona.info_persona.primer_nombre%type;
    Segundo_nombre persona.info_persona.segundo_nombre%type;
    Primer_apellido persona.info_persona.primer_apellido%type;
    Segundo_apellido persona.info_persona.segundo_apellido%type;
    fecha_nac persona.info_persona.fecha_nacimiento%type;
    genero persona.info_persona.genero%type;
    id_estado lugar.id%type;
    id_pais lugar.id%type;
    estado2 lugar.nombre%type;
    pais_bandera lugar.bandera%type;
    patologias varchar(20);



    begin   
    
        if((pais is not null) and (estado is not null) and (presencia_patologica is not null) and (edad is not null)) then
             Select id into id_pais from lugar where nombre = pais;
             Select id into id_estado from lugar where nombre = estado;
            if(presencia_patologica = 'Si') then    
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                      from persona p, patologia_persona pp, patologia pa, estatus_persona ep
                      where   ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus = 4) and  p.id = ep.fk_persona) and (p.fk_lugar = id_estado) and 
                     (p.id = pp.fk_persona) and (pa.id = pp.fk_patologia) and
                     (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                     GROUP BY p.id,  p.fk_lugar) tabla;
             else if(presencia_patologica = 'No') then   
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                null Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu
                      from persona p, patologia_persona pp, patologia pa, estatus_persona ep
                      where   ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus= 4) and  p.id = ep.fk_persona)and (p.fk_lugar = id_estado) and 
                     (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                     GROUP BY p.id,  p.fk_lugar) tabla;   
              end if;
              end if;
              
        else if((pais is not null) and (estado is not null) and (presencia_patologica is not null) and (edad is null))then      
            Select id into id_pais from lugar where nombre = pais;
            Select id into id_estado from lugar where nombre = estado;  
            if(presencia_patologica = 'Si') then  
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                      from persona p, patologia_persona pp, patologia pa, estatus_persona ep
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus= 4)and  p.id = ep.fk_persona)  and (p.fk_lugar = id_estado) and 
                     (p.id = pp.fk_persona) and (pa.id = pp.fk_patologia)
                     GROUP BY p.id,  p.fk_lugar) tabla;
             else if(presencia_patologica = 'No') then   
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                null Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu
                      from persona p, patologia_persona pp, patologia pa, estatus_persona ep
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus =4) and  p.id = ep.fk_persona) and (p.fk_lugar = id_estado)
                     GROUP BY p.id,  p.fk_lugar) tabla;   
              end if;
              end if;
              
        else if((pais is not null) and (estado is not null) and (presencia_patologica is null) and (edad is not null))then
            Select id into id_pais from lugar where nombre = pais;
            Select id into id_estado from lugar where nombre = estado;  
            OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                  from persona p left outer join patologia_persona pp on p.id = pp.fk_persona left outer join patologia pa on pa.id = pp.fk_patologia,
                  estatus_persona ep
                 where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar = id_estado) and 
                  (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                  GROUP BY p.id,  p.fk_lugar) tabla;
                  
        else if ((pais is not null) and (estado is null) and (presencia_patologica is not null) and (edad is not null))then
            Select id into id_pais from lugar where nombre = pais; 
            if(presencia_patologica = 'Si') then  
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                      from persona p, patologia_persona pp, patologia pa, estatus_persona ep,lugar l, lugar u
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar=l.id) and (l.fk_lugar = u.id) and (u.id=id_pais) and
                     (p.id = pp.fk_persona) and (pa.id = pp.fk_patologia) and
                     (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                     GROUP BY p.id,  p.fk_lugar) tabla;
             else if(presencia_patologica = 'No') then   
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                null Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu
                      from persona p, estatus_persona ep, lugar l, lugar u
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus =4) and  p.id = ep.fk_persona) and (p.fk_lugar=l.id) and (l.fk_lugar = u.id) and (u.id=id_pais)
                      and (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                     GROUP BY p.id,  p.fk_lugar) tabla;   
              end if;
              end if; 
              
        else if ((pais is null) and (estado is not null) and (presencia_patologica is not null) and (edad is not null))then
            Select id into id_estado from lugar where nombre = estado;
            Select fk_lugar into id_pais from lugar where id = id_estado;
            if(presencia_patologica = 'Si') then  
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                      from persona p, patologia_persona pp, patologia pa, estatus_persona ep
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar = id_estado) and 
                     (p.id = pp.fk_persona) and (pa.id = pp.fk_patologia) and
                     (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                     GROUP BY p.id,  p.fk_lugar) tabla;
             else if(presencia_patologica = 'No') then 
              Select id into id_estado from lugar where nombre = estado;
              Select fk_lugar into id_pais from lugar where id = id_estado;
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                null Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu
                      from persona p, estatus_persona ep
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar = id_estado)
                     GROUP BY p.id,  p.fk_lugar) tabla;   
              end if;
              end if;
              
        else if((pais is not null) and (estado is  null) and (presencia_patologica is  null) and (edad is  null))then
            Select id into id_pais from lugar where nombre = pais;
            OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                  from persona p left outer join patologia_persona pp on p.id = pp.fk_persona left outer join patologia pa on pa.id = pp.fk_patologia,
                  estatus_persona ep, lugar l, lugar u
                 where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar=l.id) and (l.fk_lugar = u.id) and (u.id=id_pais)
                  GROUP BY p.id,  p.fk_lugar) tabla;   
                  
         else if((pais is null) and (estado is not null) and (presencia_patologica is  null) and (edad is  null))then
            Select id into id_estado from lugar where nombre = estado;
            Select fk_lugar into id_pais from lugar where id = id_estado;
            OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                      from persona p left outer join patologia_persona pp on p.id = pp.fk_persona left outer join patologia pa on pa.id = pp.fk_patologia, 
                      estatus_persona ep
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar = id_estado) 
                     GROUP BY p.id,  p.fk_lugar) tabla;  
                     
        else if((pais is null) and (estado is  null) and (presencia_patologica is not null) and (edad is null)) then
            if(presencia_patologica = 'Si') then  
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select u.bandera from lugar l, lugar u where tabla.lu = l.id and l.fk_lugar = u.id) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                      from persona p, patologia_persona pp, patologia pa, estatus_persona ep, lugar l
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4)and  p.id = ep.fk_persona) and (p.fk_lugar = l.id) and 
                     (p.id = pp.fk_persona) and (pa.id = pp.fk_patologia)
                     GROUP BY p.id,  p.fk_lugar) tabla;
             else if(presencia_patologica = 'No') then    
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select u.bandera from lugar l, lugar u where tabla.lu = l.id and l.fk_lugar = u.id) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                null Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu
                      from persona p, estatus_persona ep, lugar l
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and p.fk_lugar = l.id
                     GROUP BY p.id,  p.fk_lugar) tabla;   
              end if;
              end if;    
        else if ((pais is null) and (estado is  null) and (presencia_patologica is null) and (edad is not null)) then
            OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select u.bandera from lugar l, lugar u where tabla.lu = l.id and l.fk_lugar = u.id) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu)estado,
                tabla.patologias Patologias
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                      from persona p left outer join patologia_persona pp on p.id = pp.fk_persona left outer join patologia pa on pa.id = pp.fk_patologia, 
                      estatus_persona ep, lugar l
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4)and  p.id = ep.fk_persona) and (p.fk_lugar = l.id) and 
                    (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                     GROUP BY p.id,  p.fk_lugar) tabla;  
        
        else if ((pais is null) and (estado is  null) and (presencia_patologica is null) and (edad is  null)) then
            OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select u.bandera from lugar l, lugar u where tabla.lu = l.id and l.fk_lugar = u.id) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu)estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                  from persona p left outer join patologia_persona pp on p.id = pp.fk_persona left outer join patologia pa on pa.id = pp.fk_patologia,
                  estatus_persona ep, lugar l
                 where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar=l.id) 
                  GROUP BY p.id,  p.fk_lugar) tabla;  
        
        else if ((pais is not null) and (estado is not  null) and (presencia_patologica is null) and (edad is  null)) then
          Select id into id_pais from lugar where nombre = pais;
          Select id into id_estado from lugar where nombre = estado;
          OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                  from persona p left outer join patologia_persona pp on p.id = pp.fk_persona left outer join patologia pa on pa.id = pp.fk_patologia,
                  estatus_persona ep
                 where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar=id_estado) 
                  GROUP BY p.id,  p.fk_lugar) tabla;  
                  
        else if ((pais is not null) and (estado is  null) and (presencia_patologica is null) and (edad is not null)) then       
            Select id into id_pais from lugar where nombre = pais;
            OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                  from persona p left outer join patologia_persona pp on p.id = pp.fk_persona left outer join patologia pa on pa.id = pp.fk_patologia,
                  estatus_persona ep, lugar l, lugar u
                 where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar=l.id) and (l.fk_lugar = u.id) and (u.id=id_pais)
                 and (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                  GROUP BY p.id,  p.fk_lugar) tabla;    
                  
        else if ((pais is null) and (estado is  null) and (presencia_patologica is not null) and (edad is not null)) then 
            if(presencia_patologica = 'Si') then  
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select u.bandera from lugar l, lugar u where tabla.lu = l.id and l.fk_lugar = u.id) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                      from persona p, patologia_persona pp, patologia pa, estatus_persona ep,  lugar l
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar = l.id) and 
                     (p.id = pp.fk_persona) and (pa.id = pp.fk_patologia) and
                     (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                     GROUP BY p.id,  p.fk_lugar) tabla;
             else if(presencia_patologica = 'No') then 
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select u.bandera from lugar l, lugar u where tabla.lu = l.id and l.fk_lugar = u.id) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                null Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu
                      from persona p,  estatus_persona ep, lugar l
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar = l.id) and
                      (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                     GROUP BY p.id,  p.fk_lugar) tabla;   
              end if;
              end if;   
        else if ((pais is not null) and (estado is  null) and (presencia_patologica is  null) and (edad is not null)) then
             Select id into id_pais from lugar where nombre = pais;    
             OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                  from persona p left outer join patologia_persona pp on p.id = pp.fk_persona left outer join patologia pa on pa.id = pp.fk_patologia,
                  estatus_persona ep, lugar l
                 where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar = l.id) and 
                  (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                  GROUP BY p.id,  p.fk_lugar) tabla;
                  
        else if ((pais is null) and (estado is not null) and (presencia_patologica is not null) and (edad is null)) then
            Select id into id_estado from lugar where nombre = estado;
            if(presencia_patologica = 'Si') then  
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select u.bandera from lugar l, lugar u where tabla.lu = l.id and l.fk_lugar = u.id) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                      from persona p, patologia_persona pp, patologia pa, estatus_persona ep
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar = id_estado) and 
                     (p.id = pp.fk_persona) and (pa.id = pp.fk_patologia) 
                     GROUP BY p.id,  p.fk_lugar) tabla;
             else if(presencia_patologica = 'No') then 
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select u.bandera from lugar l, lugar u where tabla.lu = l.id and l.fk_lugar = u.id) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                null Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu
                      from persona p, estatus_persona ep
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar = id_estado)
                     GROUP BY p.id,  p.fk_lugar) tabla;   
              end if;
              end if;   
              
        else if ((pais is not null) and (estado is null) and (presencia_patologica is not null) and (edad is null)) then
             Select id into id_pais from lugar where nombre = pais ;   
            if(presencia_patologica = 'Si') then    
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                      from persona p, patologia_persona pp, patologia pa, estatus_persona ep, lugar l, lugar u
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar=l.id) and (l.fk_lugar = u.id) and (u.id=id_pais) and
                     (p.id = pp.fk_persona) and (pa.id = pp.fk_patologia) 
                     GROUP BY p.id,  p.fk_lugar) tabla;
             else if(presencia_patologica = 'No') then   
                OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select l.bandera from lugar l where l.id = id_pais) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                (Select l.nombre from lugar l where l.id = tabla.lu) estado,
                null Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu
                      from persona p, estatus_persona ep, lugar l, lugar u
                      where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar=l.id) and (l.fk_lugar = u.id) and (u.id=id_pais) 
                     GROUP BY p.id,  p.fk_lugar) tabla;   
              end if;
              end if;
              
        else if((pais is null) and (estado is not null) and (presencia_patologica is null) and (edad is not null))then
            Select id into id_estado from lugar where nombre = estado;  
            OPEN cursore FOR
                Select(Select p.foto from persona p where p.id = tabla.i) foto, 
                (Select p.info_persona.primer_nombre from persona p where p.id = tabla.i)  Primer_nombre,
                (Select p.info_persona.segundo_nombre from persona p where p.id = tabla.i) Segundo_nombre,
                (Select p.info_persona.primer_apellido from persona p where p.id = tabla.i) Primer_apellido,
                (Select p.info_persona.segundo_apellido from persona p where p.id = tabla.i) Segundo_apellido,
                (Select p.info_persona.fecha_nacimiento from persona p where p.id = tabla.i) Fecha_nacimiento,
                (Select u.bandera from lugar l, lugar u where tabla.lu = l.id and l.fk_lugar = u.id) Pais,
                (Select p.info_persona.genero from persona p where p.id = tabla.i) Genero,
                estado,
                tabla.patologias Patologias
    
                into foto, Primer_nombre, Segundo_nombre, Primer_apellido, Segundo_apellido, fecha_nac, pais_bandera, genero, estado2, patologias
                From (Select p.id i, p.fk_lugar lu, LISTAGG(pa.nombre, ', ') within Group (order by p.id) Patologias
                  from persona p left outer join patologia_persona pp on p.id = pp.fk_persona left outer join patologia pa on pa.id = pp.fk_patologia,
                  estatus_persona ep
                 where  ((ep.fk_estatus = 2 or ep.fk_estatus = 3 or ep.fk_estatus=4) and  p.id = ep.fk_persona) and (p.fk_lugar = id_estado) and 
                  (SELECT TRUNC((MONTHS_BETWEEN(sysdate,p.Info_Persona.Fecha_Nacimiento)/12))FROM Persona where id= p.id ) = edad
                  GROUP BY p.id,  p.fk_lugar) tabla;
        end if;          
        end if;
        end if;
        end if;
        end if;
        end if;
        end if;             
        end if;
        end if;
        end if;
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
execute Reporte1('Estados Unidos', 'California',null, 44,:cursore);