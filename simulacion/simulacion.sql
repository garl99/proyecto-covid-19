/*-------------------------------------Muertes-------------------------------------*/
create or replace function muertes(lugar_id number, fecha date, modelo number) return boolean is
cantidad_muertes1 number;
cantidad_muertes2 number;
centro_id number;
cantidad_infectados number;
muerte_id number;
cantidad_patologias number;
numero_random number;
dias number;
rango number;
begin

    if(modelo=1)then
        rango:=0.8;
    else
        rango:=0.95;
    end if;

    select count(fk_persona) into cantidad_infectados from(select count(sp.id), sp.fk_persona, p.fk_lugar, ep.fk_estatus 
    from Sintoma_Persona sp,Persona p, Estatus_Persona ep 
    where p.id=sp.fk_persona and ep.fk_persona=p.id and ep.fk_estatus!=4 and ep.fk_estatus!=3 and p.fk_lugar=lugar_id
    group by(sp.fk_persona,p.fk_lugar,ep.fk_estatus) 
    having count(*)>=4 
    order by fk_persona);

    cantidad_muertes1:=round((cantidad_infectados*(1/3))/2);
    cantidad_muertes2:=round((cantidad_infectados*(1/6))/2);
   
    IF (cantidad_infectados!=0) then 

        While(cantidad_muertes1!=0)
        loop
                select fk_persona into muerte_id from (select count(sp.id), sp.fk_persona, p.fk_lugar, ep.fk_estatus 
                from Sintoma_Persona sp,Persona p, Estatus_Persona ep 
                where p.id=sp.fk_persona and ep.fk_persona=p.id and ep.fk_estatus!=4 and ep.fk_estatus!=3 and p.fk_lugar=lugar_id
                group by(sp.fk_persona,p.fk_lugar,ep.fk_estatus) 
                having count(*)>=4 
                order by dbms_random.value)
                where rownum<=1;
                
                exit when (muerte_id is null);

                select ep.fk_centro_atencion into centro_id
                    from Estatus_Persona ep
                    where ep.fk_persona=muerte_id;
                
                select count(*) into cantidad_patologias from Patologia_Persona where fk_persona=muerte_id;

                if (cantidad_patologias>=3) then
                dias:=2;
                else
                dias:=8;
                end if;

                select dbms_random.value(0,1) into numero_random from dual;

                IF (numero_random>rango) then
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
                end if;
                cantidad_muertes1:=cantidad_muertes1-1;
        end loop;

        While(cantidad_muertes2!=0)
        loop

                select fk_persona into muerte_id from (select count(sp.id), sp.fk_persona, p.fk_lugar, ep.fk_estatus 
                from Sintoma_Persona sp,Persona p, Estatus_Persona ep 
                where p.id=sp.fk_persona and ep.fk_persona=p.id and ep.fk_estatus!=4 and ep.fk_estatus!=3 and p.fk_lugar=lugar_id
                group by(sp.fk_persona,p.fk_lugar,ep.fk_estatus) 
                having count(*)>=4 
                order by dbms_random.value)
                where rownum<=1;
                
                exit when (muerte_id is null);

 
                select ep.fk_centro_atencion into centro_id
                from Estatus_Persona ep
                where ep.fk_persona=muerte_id;

                select count(*) into cantidad_patologias from Patologia_Persona where fk_persona=muerte_id;

                if (cantidad_patologias>=3) then
                dias:=2;
                else
                dias:=3;
                end if;

                select dbms_random.value(0,1) into numero_random from dual;

                IF (numero_random>0.8) then

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

                end if;

                cantidad_muertes2:=cantidad_muertes2-1;
        end loop;

    end if;
    return true;

    exception
      when no_data_found then
        return false; 
       
end;


/*-------------------------------------Recuperacion----------------------------------------*/
create or replace function recuperacion(lugar_id number, fecha date) return boolean is
cantidad_recuperacion number;
dias number;
caso1 number;
caso2 number;
persona_id number;
centro_id number;
numero_random number;

begin

    select count(*) into cantidad_recuperacion from Estatus_Persona ep, Persona p
    where ep.fk_persona=p.id and p.fk_lugar=lugar_id and ep.fk_estatus=2;

    caso1:=round((cantidad_recuperacion*0.125)/2);
    caso2:=round((cantidad_recuperacion*0.375)/2);

    IF (cantidad_recuperacion!=0) then

        While (caso1!=0) 
        loop
             select fk_persona,fk_centro_atencion into persona_id, centro_id
             from (select ep.fk_persona,ep.fk_centro_atencion
                    from Estatus_Persona ep, Persona p 
                    where ep.fk_estatus=2 and ep.fk_persona=p.id and p.fk_lugar=lugar_id order by dbms_random.value ) 
                    where rownum=1;

            select dbms_random.value(0,1) into numero_random from dual;
            
            IF(numero_random>0.6) then
                update Estatus_Persona
                    set fk_estatus=3,fecha_recuperacion=fecha+7
                where fk_persona=persona_id;

                update Centro_Atencion
                    set nro_camas_ocupadas=nro_camas_ocupadas-1
                where id=centro_id;
            end if;

          caso1:=caso1-1;
        end loop;

        While (caso2!=0) 
        loop
            select fk_persona,fk_centro_atencion into persona_id, centro_id
             from (select ep.fk_persona,ep.fk_centro_atencion
                    from Estatus_Persona ep, Persona p 
                    where ep.fk_estatus=2 and ep.fk_persona=p.id and p.fk_lugar=lugar_id order by dbms_random.value ) 
                    where rownum=1;
          
            select dbms_random.value(0,1) into numero_random from dual;
            
            IF(numero_random>0.6) then
              update Estatus_Persona
                set fk_estatus=3,fecha_recuperacion=fecha+2
              where fk_persona=persona_id;

             update Centro_Atencion
                set nro_camas_ocupadas=nro_camas_ocupadas-1
              where id=centro_id;
            end if;
              
           caso2:=caso2-1;
        end loop;

    end if;
    return true;

    exception
      when no_data_found then
        return false;
end;




/*-------------------------------PROCEDURE QUE LLENA CENTRO -------------------------------*/
create or replace procedure llenarCentros(modelo number, lugar_id number, fecha date) is
    cantidad_asistencia number;
    cursor c_sintoma is select count(sp.id), sp.fk_persona, p.fk_lugar from Sintoma_Persona sp,Persona p where p.id=sp.fk_persona and p.fk_lugar=lugar_id group by(fk_persona,fk_lugar) having count(*)>=4 order by fk_persona;
    cont number;
    paciente_id number;
    estatus_id number;
    probabilidad_tipo number;
    centro_id number;
    camas_totales number;
    camas_ocupadas number;
    fk_lugar_persona number;
    cantidad_estatus1 number;
begin


    cont:=0;
    FOR fila in c_sintoma
        LOOP
            cont:=cont+1;
        END LOOP;
    
    IF (modelo=1) THEN
        cantidad_asistencia:=round(cont*0.1);
    ELSE
        cantidad_asistencia:=round(cont*0.01);    
    END IF;
    
    WHILE(cantidad_asistencia!=0)
    LOOP

        LOOP
            select fk_persona into paciente_id from (
            select count(sp.id), sp.fk_persona, p.fk_lugar 
                from Sintoma_Persona sp,Persona p 
                where p.id=sp.fk_persona and p.fk_lugar=lugar_id
                group by(fk_persona,fk_lugar) 
                having count(*)>=4 
                order by dbms_random.value)
            where ROWNUM=1;

            select fk_estatus into estatus_id from Estatus_Persona where fk_persona=paciente_id;
            select count(*) into cantidad_estatus1 from Estatus_Persona where fk_estatus=1;
            EXIT WHEN (estatus_id=1 OR cantidad_estatus1=0);
        END LOOP;

        IF(cantidad_estatus1!=0) then

            
            select p.fk_lugar into fk_lugar_persona from Persona p where p.id=paciente_id;
            select dbms_random.value(0,1) into probabilidad_tipo from dual;

            IF (probabilidad_tipo>0.3) THEN
                select id, nro_camas_totales,nro_camas_ocupadas into centro_id,camas_totales,camas_ocupadas from (
                select id, nro_camas_totales,nro_camas_ocupadas from centro_atencion where fk_lugar=fk_lugar_persona and tipo='hospital' order by dbms_random.value)
                where rownum<=1;
            ELSE

                select id, nro_camas_totales,nro_camas_ocupadas into centro_id,camas_totales,camas_ocupadas from (
                select id, nro_camas_totales,nro_camas_ocupadas from centro_atencion where fk_lugar=fk_lugar_persona and tipo='clinica' order by dbms_random.value)
                where rownum<=1;

            END IF;

            IF(camas_totales!=camas_ocupadas) THEN
                update Estatus_Persona --Hacer trigger para matar 
                set fk_estatus=2,fk_centro_atencion=centro_id,fecha_infeccion=fecha
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

        else
            dbms_output.put_line('P-Infeccion total en en el lugar');
            cantidad_asistencia:=0;    
        end if;

        cantidad_asistencia:=cantidad_asistencia-1;
    END LOOP;
end;





/*-------------------------------PROCEDURE GENERA VIAJES-------------------------------------*/
create or replace procedure viajes(modelo number, lugar_id number, fecha date) is
cantidad_viajeros number;
cursor c_sintoma is select count(sp.id), sp.fk_persona, p.fk_lugar from Sintoma_Persona sp,Persona p where p.id=sp.fk_persona and p.fk_lugar=lugar_id group by(fk_persona,fk_lugar) having count(*)>=4 order by fk_persona;
cont number;
estatus_id number;
cantidad_estatus1 number;
persona_id number;
lugar_origen number;
lugar_destino number;
avion_id number;
pasajero_id number;
begin

    cont:=0;
    FOR fila in c_sintoma
        LOOP
        cont:=cont+1;
    END LOOP;

    if(modelo=1) then
        cantidad_viajeros:=round(cont*0.20);
    else
        cantidad_viajeros:=round(cont*0.01);
    end if;

    if(Rango_Fecha.validar_fecha_viajes(lugar_id))then
        While (cantidad_viajeros!=0) 
        loop
            LOOP
                select fk_persona, fk_lugar into persona_id, lugar_origen from (
                select count(sp.id), sp.fk_persona, p.fk_lugar 
                    from Sintoma_Persona sp,Persona p 
                    where p.id=sp.fk_persona and p.fk_lugar=lugar_id
                    group by(fk_persona,fk_lugar) 
                    having count(*)>=4 
                    order by dbms_random.value)
                where ROWNUM=1;

                select fk_estatus into estatus_id from Estatus_Persona where fk_persona=persona_id;
                select count(*) into cantidad_estatus1 from Estatus_Persona where fk_estatus=1;
                EXIT WHEN (estatus_id=1 OR cantidad_estatus1=0);
            END LOOP;

            IF(cantidad_estatus1!=0) then

                LOOP
                    select dbms_random.value(16,20) into lugar_destino from dual; --CAMBIAR DE 16,65 PARA SIMULACION COMPLETA
                    lugar_destino:=round(lugar_destino);
                    EXIT WHEN(lugar_destino!=lugar_origen);
                END LOOP;

                if (Rango_Fecha.validar_fecha_viajes(lugar_destino))  then
                
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
                    infectar_personas(1,lugar_destino,modelo,fecha);
                    insert into Viaje (id, fecha_inicio, fk_pasajero, fk_origen, fk_destino, fk_avion) values (sec_viaje.nextval, TO_DATE(fecha,'DD/MM/YYYY'),pasajero_id, lugar_origen,lugar_destino,avion_id);
                    
                else
                    dbms_output.put_line ('P-Fronteras y vuelos cerrados en pais destino'); 
                end if;

            else
                dbms_output.put_line('P-Infeccion total en en el lugar');
                cantidad_viajeros:=0;    
            end if;
            
          cantidad_viajeros:=cantidad_viajeros-1;      
        end loop;
    else
        dbms_output.put_line ('P-Fronteras y vuelos cerrados en pais origen'); 
    end if;

end;




/*-------------------------------PROCEDURE QUE AÑADE SINTOMAS---------------------------------*/

create or replace procedure anade_sintoma(persona_id number,fecha date, modelo number) is
cont3 number;
cantidad_sintomas_a_generar number;
sintoma_id_previo number;
sintoma_id number;
sintoma_id_random number;
cantidad_sintomas number;

begin

    select sp.fk_sintoma into sintoma_id from Sintoma_Persona sp where sp.fk_persona=persona_id and rownum<=1; 
    dbms_output.put_line ('P-SINTOMA-ID'||sintoma_id);
    select dbms_random.value(3,5) into cantidad_sintomas_a_generar from dual;
    cantidad_sintomas_a_generar:=round(cantidad_sintomas_a_generar);
    dbms_output.put_line ('P-SINTOMAS-GENERAR'|| cantidad_sintomas_a_generar); 

    select count(*) into cantidad_sintomas from Sintoma_Persona where fk_persona=persona_id;


    IF ((cantidad_sintomas=1 OR cantidad_sintomas=0)) then
        cont3:=0;
        WHILE(cont3<cantidad_sintomas_a_generar) 
            LOOP
            sintoma_id_previo:=sintoma_id;
                LOOP 
                    select dbms_random.value(1,15) into sintoma_id_random from dual; 
                    sintoma_id_random:=round(sintoma_id_random);
                    EXIT WHEN (sintoma_id_random!=sintoma_id_previo);
                END LOOP;

                dbms_output.put_line ('P-SINTOMAS'); 
                dbms_output.put_line ('P-SINTOMAS-RANDOM'||sintoma_id_random); 
                dbms_output.put_line ('P-SINTOMAS-PERSONA'||persona_id); 
                insert into Sintoma_Persona (id, fecha_sintoma, atencion_medica, fk_sintoma,fk_persona) 
                values (sec_sintoma_persona.nextval,fecha,'F',sintoma_id_random,persona_id);

                cont3:=cont3+1;
                sintoma_id_previo:=sintoma_id_random;
            END LOOP;
    END IF;
end;

/*------------------------------ PROCEDIMIENTO PARA INFECTAR-------------------------------------*/

create or replace procedure infectar_personas(cantidad_personas number, lugar_id number, modelo number, fecha date)
is            
infectados number;                  --infectados de la simulacion. Varia durante la misma
saludable_id number;                --persona saludable que se toma de manera aleatoria para infectar
persona_id number;                   --status de la persona que sale y es posible que infecte en caso de tener el virus
cont number;                        --un simple contador para simular la salida
cont2 number;                       --un simple contador para simular la infeccion 
personas_a_contagiar number;          --random para contagiar     
cantidad_sintomas number;
cantidad_sintomas2 number;
estatus_id number;
BEGIN

    dbms_output.put_line ('F-CANTIDAD PERSONAS: '|| cantidad_personas );  -- Personas que salen
    dbms_output.put_line ('F-LUGAR_ID: '|| lugar_id);  -- id de lugar
    dbms_output.put_line ('F-MODELO '|| modelo);  -- modelo elegido

    cont:=0;
    while (cont < cantidad_personas)    --ciclo para simular salidas tomando como limite la cantidad total de habitantes.
        LOOP

            IF (modelo=1) THEN
                select dbms_random.value(6,8) into personas_a_contagiar from dual;

            ELSE IF (modelo=2) THEN  
                personas_a_contagiar:=1;
            END IF;  
            END IF; 

            dbms_output.put_line ('F-CANTIDAD A INFECTAR: '|| round(personas_a_contagiar));       
     
            select count(p.id) into infectados
            from Persona p , Sintoma_Persona sp, Sintoma s
            where p.fk_lugar=lugar_id and s.id=sp.fk_sintoma and sp.fk_persona=p.id;       --contamos las personas que se encuentran actualmente infectadas
           
            dbms_output.put_line ('F-PERSONAS CON SINTOMAS COVID-19: '|| infectados);

        
            select id into persona_id from                --Elegimos una persona random que sale de su hogar
            (select p.id from Persona p, Estatus_Persona ep
            where p.fk_lugar=lugar_id AND ep.fk_persona=p.id AND ep.fk_estatus=1 
            order by dbms_random.value )
            where rownum = 1;


            dbms_output.put_line ('F-Persona que sale: '|| persona_id);   

            select count(sp.id) into cantidad_sintomas from Sintoma_Persona sp where sp.fk_persona=persona_id; --Añadir esto al TDA
            select ep.fk_estatus into estatus_id from Estatus_Persona ep where ep.fk_persona=persona_id;

            dbms_output.put_line ('F1-cantidad_sintomas: '|| cantidad_sintomas); 
            dbms_output.put_line ('F1-estatus_id: '|| estatus_id); 

            IF (cantidad_sintomas=1 AND estatus_id=1) then

                anade_sintoma (persona_id,fecha,modelo);
                select count(sp.id) into cantidad_sintomas from Sintoma_Persona sp where sp.fk_persona=persona_id; --Añadir esto al TDA

            END IF;          

            dbms_output.put_line ('F2-cantidad_sintomas: '|| cantidad_sintomas);  
            IF(cantidad_sintomas>=4) then       --condicion que valida si la persona que salio tiene sintomas de covid-19
                cont2:=0;
                while (cont2 < round(personas_a_contagiar))  --Aqui elige una persona random saludable y la infecta.
                    LOOP
                        select id into saludable_id from                
                        (select p.id from Persona p, Estatus_Persona ep where p.fk_lugar=lugar_id and ep.fk_persona=p.id and ep.fk_estatus=1 
                        order by dbms_random.value)
                        where rownum = 1;

                        select count(sp.id) into cantidad_sintomas2 from Sintoma_Persona sp where sp.fk_persona=saludable_id; --Añadir esto al TDA

                        IF (cantidad_sintomas2=1) then
                            anade_sintoma (saludable_id,fecha,modelo);
                        END IF; 
                        
                        dbms_output.put_line ('F-status saludable: '|| saludable_id );   

                        cont2:=cont2+1;
                    END LOOP;
            END IF;

        cont:= cont+1;
        END LOOP;
END; 




/*------------------------------3.PRINCIPAL STORED PROCEDURE-----------------------------------*/


create or replace procedure simulacion (modelo number) 
is
cantidad_infectados number;                              --cantidad de infectados despues de simular
cantidad_infectados2 number;                             --cantidad de infectados antes de simular
cantidad_personas number;    
dias number;
contador_dias number;
nuevos_casos number;
fecha date;
flag_recuperacion boolean;
flag_muertes boolean;
dia_recuperacion number;


cursor c_estados is select * from Lugar where tipo='estado' order by id;


                                                        /*Probalidad de movilidad personas de acuerdo al modelo
                                                        M2=0.0625, M4=0.125, M3=0.25, M1=1. Como parte de nuestras
                                                        reglas de negocio se explica porque se tomo 0.05 para la
                                                        cuarentena*/
  

BEGIN 
    dbms_output.put_line ('P-MODELO: '|| modelo); 
    dbms_output.put_line ('P-FECHA: '|| sysdate); 
    fecha:=sysdate;

    select dbms_random.value(30,60) into dias from dual;
    dias:=round(dias);
    dia_recuperacion:=round(dias*0.6);

    dbms_output.put_line ('-------------INICIO DE LA SIMULACION----------');  

    contador_dias:=1;
    WHILE (contador_dias<=3) --solo 30 dias pruebas
    LOOP

        FOR fila in c_estados
        LOOP
                select count(p.id) into cantidad_infectados2 
                from Persona p , Estatus_Persona ep, Estatus e
                where p.fk_lugar=fila.id and p.id=ep.fk_persona and ep.fk_estatus=e.id and ep.fk_estatus=2;

                select count(p.id) into cantidad_personas from Persona p where p.fk_lugar=fila.id;                            --Se guarda la cantidad de personas de ese lugar  
                dbms_output.put_line ('P-TOTAL PERSONAS: '|| cantidad_personas);  

                dbms_output.put_line ('Cantidad de personas infectadas ANTES de la simulacion para el modelo'||' '||modelo ||': '||cantidad_infectados2 || ', en '|| fila.nombre || ',en el dia: ' || contador_dias);  

                IF (modelo=1) THEN                                                                                               
                    infectar_personas(round(cantidad_personas*0.95),fila.id,modelo,fecha);    --llamada a funcion que infecta
                    llenarcentros(modelo,fila.id,fecha);
                    viajes(modelo,fila.id,fecha);
                    
                    if(contador_dias=2) then
                     flag_recuperacion:= recuperacion(fila.id,fecha,modelo);
                    end if;
                    flag_muertes:=muertes(fila.id,fecha);

                ELSE IF (modelo=2) THEN  
                     infectar_personas(round(cantidad_personas*0.0625),fila.id,modelo,fecha);    --llamada a funcion que infecta
                     llenarcentros(modelo,fila.id,fecha);
                     viajes(modelo,fila.id,fecha);
                    
                    if(contador_dias=2) then
                     flag_recuperacion:= recuperacion(fila.id,fecha);
                    end if;
                     flag_muertes:=muertes(fila.id,fecha,modelo);
                END IF;
                END IF;

                select count(p.id) into cantidad_infectados 
                from Persona p , Estatus_Persona ep, Estatus e
                where p.fk_lugar=fila.id and p.id=ep.fk_persona and ep.fk_estatus=e.id and ep.fk_estatus=2;

                nuevos_casos:=cantidad_infectados-cantidad_infectados2;
                dbms_output.put_line (''); 
                dbms_output.put_line ('-------------FIN DE LA SIMULACION----------'); 
                dbms_output.put_line ('');
                IF (cantidad_infectados<cantidad_personas) THEN
                        dbms_output.put_line ('Cantidad de personas infectadas DESPUES de la simulacion para el modelo '||modelo ||': '||cantidad_infectados || ', en '|| fila.nombre || ',en el dia: ' || contador_dias); 
                        dbms_output.put_line ('Cantidad de casos nuevos: + '|| nuevos_casos);  
                ELSE  
                        dbms_output.put_line ('El total de la poblacion esta infectada para el modelo '||modelo ||': '||cantidad_infectados || ', en '|| fila.nombre || ',en el dia: ' || contador_dias); 
                        dbms_output.put_line ('Cantidad de casos nuevos: + '|| nuevos_casos); 
                END IF;
        
        END LOOP;

    contador_dias:=contador_dias+1;
    fecha:=fecha+1;
    END LOOP;

END;


/*------------------------------Ejecutar Simulacion------------------------*/

set serveroutput on size unlimited;
execute simulacion(1);

select count(sp.id), sp.fk_persona, p.fk_lugar from Sintoma_Persona sp,Persona p where p.id=sp.fk_persona group by(fk_persona,fk_lugar) having count(*)>=4 order by fk_persona;

select * from centro_atencion;
select SUM(nro_camas_ocupadas) from centro_atencion;
select count(*) from Estatus_Persona where fk_estatus=3;

select * from Estatus_Persona where fk_estatus=2;

select  count(*) from viaje;
select count(*),fk_pasajero from viaje group by fk_pasajero;



------------------------------------------------------------------------


update centro_atencion set nro_camas_ocupadas=0;
delete from viaje;
delete from sintoma_persona;
update Estatus_Persona set fk_centro_atencion=null,fecha_fallecimiento=null,fecha_infeccion=null,fecha_recuperacion=null,fk_estatus=1;


