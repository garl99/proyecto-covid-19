/*--------------------------EJECUTAR----------------------------*/
set serveroutput on size unlimited;
execute iniciar_simulacion(1,'27/05/2020');

/*---------------------- INICIAR SIMULACION---------------------*/

create or replace procedure iniciar_simulacion (modelo number,fecha_inicial date) is
fecha date;
escala_velocidad number;
flag_recuperar boolean;
flag_matar boolean;
empezar_recuperacion number;
empezar_muertes number;

begin
    flag_matar:=false;
    flag_recuperar:=false;
    
    fecha:=TO_DATE(fecha_inicial,'DD/MM/YYYY');
    escala_velocidad:=15;
    empezar_recuperacion:=(escala_velocidad-round(escala_velocidad*0.6));
    empezar_muertes:=(escala_velocidad-round(escala_velocidad*0.5));

    while (escala_velocidad!=0)
        loop
        
        if(escala_velocidad<=empezar_recuperacion) then
            flag_recuperar:=true;
        end if;
        
        if(escala_velocidad<=empezar_muertes) then
            flag_matar:=true;
        end if;
        
        simulacion(modelo,fecha,flag_recuperar,flag_matar);

        fecha:=fecha+10;
        escala_velocidad:=escala_velocidad-1;
    end loop;

    actualizar_porcentajes();
end;

/*----------------------------SIMULACION----------------------------*/
create or replace procedure simulacion (modelo number,fecha_inicial date,flag_recuperacion boolean, flag_muertes boolean) 
is
cantidad_personas number;    
dias number;
contador_dias number;
fecha date;
valor number;
flag_infectar boolean;
flag_recuperar boolean;
flag_muerte boolean;
cont_pais number;


BEGIN 

    dias:=1;
    fecha:=TO_DATE(fecha_inicial,'DD/MM/YYYY');
    
    contador_dias:=1;
    cont_pais:=1;

        while(cont_pais<=15)
        LOOP
            flag_infectar:= infectar_dia(cont_pais,modelo,fecha);
   
            if(flag_recuperacion) then
                flag_recuperar:= recuperar(cont_pais,modelo,fecha);
            end if;
            
            if(flag_muertes) then
                flag_muerte:= matar(cont_pais,modelo,fecha);
            end if;*/
            
            llenar_centros_atencion(cont_pais,modelo,fecha);
            
            fecha:=fecha+1;  
            cont_pais:=cont_pais+1;
        END LOOP;

        
END;

/*----------------------------AÑADE SINTOMAS----------------------------*/
create or replace procedure anade_sintomas (saludable_id number, fecha date, cantidad_sintomas_a_generar number) 
is
sintoma_id number;
persona_id number;
cantidad number;
begin
    cantidad:=cantidad_sintomas_a_generar;
    persona_id:=saludable_id;
    
    while (cantidad!=0)
    loop
    select dbms_random.value(1,15) into sintoma_id from dual;
    sintoma_id:=round(sintoma_id);
    dbms_output.put_line(sintoma_id);

    insert into Sintoma_Persona (id, fecha_sintoma, atencion_medica, fk_sintoma,fk_persona) 
    values (sec_sintoma_persona.nextval,fecha,'F',sintoma_id,persona_id);

    cantidad:=cantidad-1;
    end loop;

end;



/*----------------------------INFECTAR LUGAR----------------------------*/
create or replace function infectar_dia ( lugar_id number, modelo number, fecha date) return boolean
is
personas_a_contagiar number;
saludable_id number;
porcentaje_sintomas number;
cantidad_sintomas_a_generar number;
sintomas number;
begin

    if (modelo=1)then
        select dbms_random.value(6,8) into personas_a_contagiar from dual;
    else
        select dbms_random.value(1,2) into personas_a_contagiar from dual;

    end if;


    personas_a_contagiar:=round(personas_a_contagiar);

    WHILE (personas_a_contagiar!=0)
    loop
            select id into saludable_id from                
            (select p.id from Persona p, Estatus_Persona ep, lugar l, lugar u
            where p.fk_lugar=l.id and l.fk_lugar=u.id and u.id=lugar_id and ep.fk_persona=p.id and ep.fk_estatus=1 
            order by dbms_random.value)
            where rownum = 1;
            
            select count(*) into sintomas from sintoma_persona where fk_persona=saludable_id;
            select dbms_random.value(0,1) into porcentaje_sintomas from dual;

            if(sintomas=1)then
                if(porcentaje_sintomas>0.5) then
                    update Estatus_Persona 
                    set fk_estatus=2,fk_centro_atencion=null,fecha_infeccion=fecha
                    where fk_persona=saludable_id;
                    anade_sintomas(saludable_id,fecha,4);
                else
                    select dbms_random.value(1,5) into cantidad_sintomas_a_generar from dual;
                    cantidad_sintomas_a_generar:=round(cantidad_sintomas_a_generar);
                    anade_sintomas(saludable_id,fecha,cantidad_sintomas_a_generar);
    
                end if;
            end if;
            personas_a_contagiar:=personas_a_contagiar-1;
    end loop;

    return true;

    exception
      when no_data_found then        
        return false;

end;



/*--------------------------------Recuperar Lugar-----------------------------------------*/


create or replace function recuperar(lugar_id number, fecha date) return boolean is
cantidad_recuperacion number;
caso1 number;
caso2 number;
persona_id number;
centro_id number;
numero_random number;

begin

    select count(*) into cantidad_recuperacion from Estatus_Persona ep, Persona p, lugar l, lugar u
    where ep.fk_persona=p.id and p.fk_lugar=l.id and l.fk_lugar=u.id and u.id=lugar_id and ep.fk_estatus=2;

    caso1:=round((cantidad_recuperacion*0.125)/2);
    caso2:=round((cantidad_recuperacion*0.375)/4);
    cantidad_recuperacion:= caso1 + caso2;

        While (cantidad_recuperacion!=0) 
        loop
                select fk_persona, fk_centro_atencion into persona_id, centro_id
                from (select ep.fk_persona,ep.fk_centro_atencion
                from Estatus_Persona ep, Persona p , lugar l, lugar u
                where ep.fk_estatus=2 and ep.fk_persona=p.id and p.fk_lugar=l.id and l.fk_lugar=u.id and u.id=lugar_id 
                and ep.fk_centro_atencion is not null order by dbms_random.value ) 
                where rownum=1;

                select dbms_random.value(0,1) into numero_random from dual;

                IF(numero_random>=0.8) then
                    update Estatus_Persona
                    set fk_estatus=4,fecha_fallecimiento=fecha+15
                    where fk_persona=persona_id;

                    update Centro_Atencion
                    set nro_camas_ocupadas=nro_camas_ocupadas-1
                    where id=centro_id;

                else if(numero_random<0.7 and numero_random>=0.3) then
                    update Estatus_Persona
                    set fk_estatus=3,fecha_recuperacion=fecha+7
                    where fk_persona=persona_id;

                    update Centro_Atencion
                    set nro_camas_ocupadas=nro_camas_ocupadas-1
                    where id=centro_id;

                else if(numero_random<0.3) then   
                    update Estatus_Persona
                    set fk_estatus=3,fecha_recuperacion=fecha+2
                    where fk_persona=persona_id;

                    update Centro_Atencion
                    set nro_camas_ocupadas=nro_camas_ocupadas-1
                    where id=centro_id;

                end if;
                end if;
                end if;

            cantidad_recuperacion:=cantidad_recuperacion-1;
        end loop;

    return true;

    exception
      when no_data_found then
        return false;
end;


/*-------------------------------PROCEDURE QUE LLENA CENTRO -------------------------------*/
create or replace function llenar_centros(lugar_id number,modelo number, fecha date) return boolean
is
    cantidad_asistencia number;
    paciente_id number;
    centro_id number;
    camas_totales number;
    camas_ocupadas number;
    fk_lugar_persona number;
begin

    select count(*) into cantidad_asistencia from Estatus_Persona ep, Persona p, lugar l, lugar u
    where ep.fk_persona=p.id and p.fk_lugar=l.id and l.fk_lugar=u.id and u.id=lugar_id and ep.fk_estatus=2;
    
    DBMS_OUTPUT.PUT_LINE('CANTIDAD LLENAR CENTROS 1='||cantidad_asistencia);
    DBMS_OUTPUT.PUT_LINE('Lugar 1='|| lugar_id);
    IF (modelo=1) THEN
        cantidad_asistencia:=round(cantidad_asistencia *0.6);
        DBMS_OUTPUT.PUT_LINE('CANTIDAD LLENAR CENTROS 2='||cantidad_asistencia);
    ELSE
        cantidad_asistencia:=round(cantidad_asistencia *0.3);    
    END IF;


    WHILE(cantidad_asistencia!=0)
    LOOP

        select fk_persona into paciente_id
        from (select ep.fk_persona,ep.fk_centro_atencion
        from Estatus_Persona ep, Persona p , lugar l, lugar u
        where ep.fk_estatus=2 and ep.fk_persona=p.id and p.fk_lugar=l.id and l.fk_lugar=u.id and u.id=lugar_id 
        and ep.fk_centro_atencion is null order by dbms_random.value ) 
        where rownum=1;

            select p.fk_lugar into fk_lugar_persona from Persona p where p.id=paciente_id;


            select id, nro_camas_totales,nro_camas_ocupadas into centro_id,camas_totales,camas_ocupadas from (
            select id, nro_camas_totales,nro_camas_ocupadas from centro_atencion where fk_lugar=fk_lugar_persona order by dbms_random.value)
            where rownum<=1;


            IF(camas_totales!=camas_ocupadas) THEN
                update Estatus_Persona --Hacer trigger para matar 
                set fk_centro_atencion=centro_id
                where fk_persona=paciente_id;

                update Centro_Atencion
                set nro_camas_ocupadas=nro_camas_ocupadas+1
                where id=centro_id;

                update Sintoma_Persona
                    set atencion_medica='V'
                where fk_persona=paciente_id;

            ELSE
                dbms_output.put_line('P-EL sistema colapso');
            END IF;

        cantidad_asistencia:=cantidad_asistencia-1;
    END LOOP;
    
    return true;
    
    exception
      when no_data_found then
        return false;
end;

/*----------------------------------MUERTE------------------------------------*/

create or replace function muertes(lugar_id number,modelo number,fecha date) return boolean is

centro_id number;
cantidad_infectados number;
muerte_id number;
cantidad_patologias number;
numero_random number;
dias number;
begin


    select count(fk_persona) into cantidad_infectados from(select count(sp.id), sp.fk_persona, p.fk_lugar, ep.fk_estatus 
    from Sintoma_Persona sp,Persona p, Estatus_Persona ep , lugar l, lugar u
    where p.id=sp.fk_persona and ep.fk_persona=p.id and ep.fk_estatus!=4 and ep.fk_estatus!=3 and p.fk_lugar=l.id 
    and l.fk_lugar=u.id and u.id=lugar_id
    group by(sp.fk_persona,p.fk_lugar,ep.fk_estatus) 
    having count(*)>=4 
    order by fk_persona);

    cantidad_infectados:=round((cantidad_infectados*(1/3)))+round((cantidad_infectados*(1/6)));


        While(cantidad_infectados!=0)
        loop
                select fk_persona into muerte_id from (select count(sp.id), sp.fk_persona, p.fk_lugar, ep.fk_estatus 
                from Sintoma_Persona sp,Persona p, Estatus_Persona ep , lugar l, lugar u
                where p.id=sp.fk_persona and ep.fk_persona=p.id and ep.fk_estatus!=4 and ep.fk_estatus!=3 and p.fk_lugar=l.id 
                and l.fk_lugar=u.id and u.id=lugar_id
                group by(sp.fk_persona,p.fk_lugar,ep.fk_estatus) 
                having count(*)>=4 
                order by dbms_random.value)
                where rownum<=1;
                
                
                select ep.fk_centro_atencion into centro_id
                    from Estatus_Persona ep
                    where ep.fk_persona=muerte_id;
                
                select count(*) into cantidad_patologias from Patologia_Persona where fk_persona=muerte_id;

                if (cantidad_patologias>=3) then
                dias:=2;
                else
                    select dbms_random.value(0,1) into numero_random from dual;
                    
                    if(numero_random<0.6) then
                        dias:=8;
                    else
                        dias:=3;
                    end if;
                    
                end if;

                if (centro_id is null) then
                    update Estatus_Persona
                    set fk_estatus=4,fecha_fallecimiento=fecha+dias
                    where fk_persona=muerte_id;
                else
                    update Estatus_Persona
                    set fk_estatus=4,fecha_fallecimiento=fecha_infeccion+dias
                    where fk_persona=muerte_id;

                    update Centro_Atencion
                    set nro_camas_ocupadas=nro_camas_ocupadas-1
                    where id=centro_id; 
                end if;

                cantidad_infectados:=cantidad_infectados-1;
        end loop;

    return true;

    exception
      when no_data_found then
        return false; 
       
end;

/*-------------------------------VIAJES-------------------------------------*/
create or replace function viajes(modelo number, lugar_id number, fecha date) return boolean
is
cantidad_viajeros number;
cont number;
estatus_id number;
cantidad_estatus1 number;
persona_id number;
lugar_origen number;
lugar_destino number;
avion_id number;
pasajero_id number;
flag_infectar boolean;
valor_random number;
begin

    select count(fk_persona) into cantidad_viajeros from(select count(sp.id), sp.fk_persona, p.fk_lugar, ep.fk_estatus 
    from Sintoma_Persona sp,Persona p, Estatus_Persona ep , lugar l, lugar u
    where p.id=sp.fk_persona and ep.fk_persona=p.id and ep.fk_estatus!=4 and ep.fk_estatus!=3 and p.fk_lugar=l.id 
    and l.fk_lugar=u.id and u.id=lugar_id
    group by(sp.fk_persona,p.fk_lugar,ep.fk_estatus) 
    having count(*)>=4 
    order by fk_persona);

    if(modelo=1) then
        cantidad_viajeros:=round(cantidad_viajeros*0.20);
    else
        cantidad_viajeros:=round(cantidad_viajeros*0.10);
    end if;

    if(true)then
        While (cantidad_viajeros!=0) 
        loop

                select fk_persona, fk_lugar into persona_id, lugar_origen from(select ep.fk_persona, p.fk_lugar
                    from estatus_persona ep,Persona p ,lugar l, lugar u
                    where p.id=ep.fk_persona and p.fk_lugar=l.id and l.fk_lugar=u.id and u.id=lugar_id
                    and (ep.fk_estatus=1 or ep.fk_estatus=2)
                    order by dbms_random.value)
                where ROWNUM=1;

                LOOP
                    select dbms_random.value(16,65) into lugar_destino from dual; --CAMBIAR DE 16,65 PARA SIMULACION COMPLETA
                    lugar_destino:=round(lugar_destino);
                    EXIT WHEN(lugar_destino!=lugar_origen);
                END LOOP;

                if (true)  then

                    select id_pasajero into pasajero_id from Persona where id=persona_id;

                    if (pasajero_id is null) then
                        select dbms_random.value(1,9999999) into pasajero_id from dual;
                        pasajero_id:=round(pasajero_id);
                        update Persona
                        set id_pasajero=pasajero_id
                        where id=persona_id;
                    end if;

                    select dbms_random.value(1,15) into avion_id from dual;
                    avion_id:=round(avion_id);

                    select dbms_random.value(0,1) into valor_random from dual;

                    if(valor_random>0.6) then
                        flag_infectar:= infectar_dia(lugar_destino,modelo,fecha);
                    end if;
                    insert into Viaje (id, fecha_inicio, fk_pasajero, fk_origen, fk_destino, fk_avion) values (sec_viaje.nextval, TO_DATE(fecha,'DD/MM/YYYY'),pasajero_id, lugar_origen,lugar_destino,avion_id);

                else
                    dbms_output.put_line ('P-Fronteras y vuelos cerrados en pais destino'); 
                end if;


          cantidad_viajeros:=cantidad_viajeros-1;      
        end loop;

    end if;

        return true;

        exception
          when no_data_found then
            return false;


end;