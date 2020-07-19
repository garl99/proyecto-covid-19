--------------------------------------------------------
-- Archivo creado  - mi�rcoles-julio-01-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger DISMINUIR_INVENTARIO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ADMIN"."DISMINUIR_INVENTARIO" 
before update on Estatus_Persona
for each row
declare
centro_id number;
begin
    if(:old.fk_estatus=2 and :new.fk_centro_atencion is not null) then
        centro_id:=:new.fk_centro_atencion;

        update Centro_Insumo set cantidad=cantidad-2 where fk_centro_atencion=centro_id;

        dbms_output.put_line('Se restan 2 unidades de insumos en el centro: '||centro_id);

    end if;
end;
/
ALTER TRIGGER "ADMIN"."DISMINUIR_INVENTARIO" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_PORCENTAJES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."ACTUALIZAR_PORCENTAJES" is
cont number;
cont2 number;
muertos number;
infectados number;
recuperados number;
begin
    cont:=16;
    cont2:=6;

    while (cont<=65)
        loop
            select count(ep.fk_persona) into infectados from Estatus_Persona ep, persona p where fk_estatus=2 and p.id=ep.fk_persona and p.fk_lugar=cont;
            select count(ep.fk_persona) into recuperados from Estatus_Persona ep, persona p where fk_estatus=3 and p.id=ep.fk_persona and p.fk_lugar=cont;
            select count(ep.fk_persona) into muertos from Estatus_Persona ep, persona p where fk_estatus=4 and p.id=ep.fk_persona and p.fk_lugar=cont;

            update lugar l set l.info_cantidad.porcentaje_infectados=Info_Cantidad.calcular_porcentaje(infectados,50),
                            l.info_cantidad.porcentaje_recuperados=Info_Cantidad.calcular_porcentaje(recuperados,50),
                            l.info_cantidad.porcentaje_fallecidos=Info_Cantidad.calcular_porcentaje(muertos,50),
                            l.info_cantidad.cantidad_fallecidos=muertos,
                            l.info_cantidad.cantidad_infectados=infectados,
                            l.info_cantidad.cantidad_recuperados=recuperados
                        where l.id=cont;


            cont:=cont+1;
        end loop;

    while (cont2<=15)
        loop
            select count(*) into infectados from Estatus_Persona ep, persona p, lugar l
            where fk_estatus=2 and p.id=ep.fk_persona and l.id=p.fk_lugar and l.fk_lugar=cont2;

            select count(*) into recuperados from Estatus_Persona ep, persona p, lugar l
            where fk_estatus=3 and p.id=ep.fk_persona and l.id=p.fk_lugar and l.fk_lugar=cont2;

            select count(*) into muertos from Estatus_Persona ep, persona p, lugar l
            where fk_estatus=4 and p.id=ep.fk_persona and l.id=p.fk_lugar and l.fk_lugar=cont2;


            update lugar l set l.info_cantidad.porcentaje_infectados=Info_Cantidad.calcular_porcentaje(infectados,250),
                            l.info_cantidad.porcentaje_recuperados=Info_Cantidad.calcular_porcentaje(recuperados,250),
                            l.info_cantidad.porcentaje_fallecidos=Info_Cantidad.calcular_porcentaje(muertos,250),
                            l.info_cantidad.cantidad_fallecidos=muertos,
                            l.info_cantidad.cantidad_infectados=infectados,
                            l.info_cantidad.cantidad_recuperados=recuperados
                            where l.id=cont2;

            cont2:=cont2+1; 
        end loop;

end;

/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_RANGO_FECHAS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."ACTUALIZAR_RANGO_FECHAS" (fecha_inicio date, fecha_final date)
is
cont number;
modelo number;
begin
    cont:=6;
     while (cont<=15)
        loop
            if (cont>=6 and cont<=10) then
                modelo:=1;
            else
                modelo:=2;
            end if;

            insert into modelo_lugar (id,rango_fecha,fk_modelo,fk_lugar)
            values (sec_modelo_lugar.nextval, Rango_Fecha(fecha_inicio,fecha_final),modelo,cont);

        cont:=cont+1;
        end loop;
end;

/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_REGISTRO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."ACTUALIZAR_REGISTRO" (lugar_id number, contador number, fecha date) is
fecha_registro date;
begin
     if(contador!=0) then
            select r.fecha_registro into fecha_registro from Registro r where r.fecha_registro=fecha and r.fk_lugar=lugar_id;

            update registro set cantidad_infectados=cantidad_infectados+contador
            where fecha_registro=fecha and fk_lugar=lugar_id;        
    end if;

    exception
      when no_data_found then        
        insert into Registro(id,fecha_registro,cantidad_infectados,fk_lugar) 
        values(sec_registro.nextval,fecha,contador,lugar_id);
end;

/
--------------------------------------------------------
--  DDL for Procedure ANADE_SINTOMAS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."ANADE_SINTOMAS" (saludable_id number, fecha date, cantidad_sintomas_a_generar number) 
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

        insert into Sintoma_Persona (id, fecha_sintoma, atencion_medica, fk_sintoma,fk_persona) 
        values (sec_sintoma_persona.nextval,fecha,'F',sintoma_id,persona_id);

        cantidad:=cantidad-1;
    end loop;
end;

/
--------------------------------------------------------
--  DDL for Procedure INICIAR_SIMULACION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."INICIAR_SIMULACION" (fecha_inicial date) is
fecha date;
fecha_modelo_inicio date;
fecha_modelo_final date;
escala_velocidad number;
flag_recuperar boolean;
flag_matar boolean;
empezar_recuperacion number;
empezar_muertes number;

begin
    flag_matar:=false;
    flag_recuperar:=false;

    fecha:=TO_DATE(fecha_inicial,'DD/MM/YYYY');
    fecha_modelo_inicio:=fecha;


    escala_velocidad:=50;
    empezar_recuperacion:=(escala_velocidad-round(escala_velocidad*0.6));
    empezar_muertes:=(escala_velocidad-round(escala_velocidad*0.8));

    while (escala_velocidad!=0)
        loop
        if(escala_velocidad<=empezar_recuperacion) then
            flag_recuperar:=true;
        end if;

        if(escala_velocidad<=empezar_muertes) then
            flag_matar:=true;
        end if;
        simulacion(fecha,flag_recuperar,flag_matar);

        fecha:=fecha+0.6;
        dbms_output.put_line('--------------------------'|| fecha || '------------------------ ');
        escala_velocidad:=escala_velocidad-1;
    end loop;

    fecha_modelo_final:=fecha;
    actualizar_porcentajes();
    actualizar_rango_fechas(fecha_modelo_inicio,fecha_modelo_final);
end;

/
--------------------------------------------------------
--  DDL for Procedure REALIZAR_AYUDA_HUMANITARIA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."REALIZAR_AYUDA_HUMANITARIA" (c_id number,centro_id number,insumo_id number,fecha date) is
pais_donador number;
pais_ayudado number;
cantidad_insumos_ayuda number;
cantidad_dinero_ayuda number;
ayuda_humanitaria_id number;


begin
    select c.fk_lugar  into pais_ayudado from centro_atencion c where c.id=centro_id; 

    loop
       select dbms_random.value(11,15) into pais_donador from dual;
       pais_donador:=round(pais_donador); 
    exit when (pais_ayudado!=pais_donador);
    end loop;

    select dbms_random.value(100000,900000) into cantidad_dinero_ayuda from dual; cantidad_dinero_ayuda:=round(cantidad_dinero_ayuda);
    select dbms_random.value(100,150) into cantidad_insumos_ayuda from dual; cantidad_insumos_ayuda:=round(cantidad_insumos_ayuda);

    ayuda_humanitaria_id:=SEC_AYUDA_HUMANITARIA.nextval;

    insert into Ayuda_Humanitaria(id,fecha_donacion,cantidad_dinero,fk_pais_donador,fk_pais_ayudado) values
    (ayuda_humanitaria_id,fecha,cantidad_dinero_ayuda,pais_donador,pais_ayudado);

    insert into ayuda_insumo (id,cantidad,fk_insumo,fk_ayuda_humanitaria) values 
    (SEC_AYUDA_INSUMO.nextval,cantidad_insumos_ayuda,insumo_id,ayuda_humanitaria_id);

    update centro_insumo set cantidad=cantidad+cantidad_insumos_ayuda
    where id=c_id;

        DBMS_OUTPUT.PUT_LINE('------------AYUDA HUMANITARIA-----------');
        DBMS_OUTPUT.PUT_LINE('El pais con id= '||pais_donador||' ha dado ayuda humanitaria al pais con id= '||pais_ayudado ||' el dia= '||fecha);
        DBMS_OUTPUT.PUT_LINE('Cantidad dinero= $'||cantidad_dinero_ayuda);
        DBMS_OUTPUT.PUT_LINE('Cantidad insumo con id= '|| insumo_id || ' ,fue de '||cantidad_insumos_ayuda|| 'Unidades'); 


end;

/
--------------------------------------------------------
--  DDL for Procedure SIMULACION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."SIMULACION" (fecha_inicial date,flag_recuperacion boolean, flag_muertes boolean) 
is
cantidad_personas number;    
dias number;
contador_dias number;
fecha date;
valor number;
flag_infectar boolean;
flag_recuperar boolean;
flag_muerte boolean;
flag_llenar boolean;
cont_pais number;
flag_viajar boolean;
modelo number;


BEGIN 
    dias:=1;
    fecha:=TO_DATE(fecha_inicial,'DD/MM/YYYY');

    contador_dias:=1;
    cont_pais:=6;
        while(cont_pais<=15)
        LOOP
            if (cont_pais>=6 and cont_pais<=10) then
                modelo:=1;
            else
                modelo:=2;
            end if;

            flag_infectar:= infectar_dia(cont_pais,modelo,fecha);

            if(flag_recuperacion) then
                flag_recuperar:= recuperar(cont_pais,modelo,fecha);
            end if;
            if(flag_muertes) then
                flag_muerte:= muertes(cont_pais,modelo,fecha);
            end if;

            flag_llenar:=llenar_centros(cont_pais,modelo,fecha);
            flag_viajar:=viajes(modelo,cont_pais,fecha);

            verificar_ayuda_humanitaria(cont_pais,fecha);
            
            fecha:=fecha+0.5;  
            cont_pais:=cont_pais+1;
        END LOOP;

END;

/
--------------------------------------------------------
--  DDL for Procedure VERIFICAR_AYUDA_HUMANITARIA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."VERIFICAR_AYUDA_HUMANITARIA" (lugar_id number,fecha date) is
centro_id number;
c_id number;
insumo_id number;
cantidad_centros number;
cantidad_insumos number;
begin
    
    select count(c.id) into cantidad_centros from centro_atencion c where c.fk_lugar=lugar_id;
      
    select id into centro_id from(
    select c.id  from centro_atencion c where c.fk_lugar=lugar_id order by dbms_random.value)
    where ROWNUM<=1; 
    
    select c.id, c.fk_insumo, c.cantidad into c_id, insumo_id, cantidad_insumos from centro_insumo c where c.fk_centro_atencion=centro_id; 
    
    if(cantidad_insumos<100) then
        realizar_ayuda_humanitaria(c_id,centro_id,insumo_id,fecha);
    end if;
    
end;

/
--------------------------------------------------------
--  DDL for Function INFECTAR_DIA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ADMIN"."INFECTAR_DIA" ( lugar_id number, modelo number, fecha date) return boolean
is
personas_a_contagiar number;
saludable_id number;
porcentaje_sintomas number;
cantidad_sintomas_a_generar number;
sintomas number;
contador number;
limite number;

begin

    if (modelo=1)then
        select dbms_random.value(10,12) into personas_a_contagiar from dual;
        limite:=0.3;
    else
        select dbms_random.value(1,2) into personas_a_contagiar from dual;
        limite:=0.6;
    end if;

    contador:=0;
    personas_a_contagiar:=round(personas_a_contagiar);
    
    DBMS_OUTPUT.PUT_LINE('------------INFECCION-----------');

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
                if(porcentaje_sintomas>limite) then
                    update Estatus_Persona 
                    set fk_estatus=2,fk_centro_atencion=null,fecha_infeccion=fecha
                    where fk_persona=saludable_id;
                    anade_sintomas(saludable_id,fecha,4);
                    contador:=contador+1;

                     dbms_output.put_line('La persona con ID: '|| saludable_id || ' , se infecto el dia: ' ||fecha );
                else
                    select dbms_random.value(1,5) into cantidad_sintomas_a_generar from dual;
                    cantidad_sintomas_a_generar:=round(cantidad_sintomas_a_generar);
                    anade_sintomas(saludable_id,fecha,cantidad_sintomas_a_generar);
                    dbms_output.put_line('La persona con ID: '|| saludable_id || ' , contrajo los sintomas de covid-19 el dia: ' ||fecha );

                end if;
            else if (sintomas<=5)then
                anade_sintomas(saludable_id,fecha,1);
            end if;
            end if;          

            personas_a_contagiar:=personas_a_contagiar-1;
    end loop;

    dbms_output.put_line('FECHA= '||fecha ||' ,INFECTADOS= '||contador ||' LUGAR ID= '|| lugar_id);
    actualizar_registro(lugar_id,contador,fecha);

    return true;

    exception
      when no_data_found then        
        return false;

end;

/
--------------------------------------------------------
--  DDL for Function LLENAR_CENTROS
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ADMIN"."LLENAR_CENTROS" (lugar_id number,modelo number, fecha date) return boolean
is
    cantidad_asistencia number;
    paciente_id number;
    centro_id number;
    camas_totales number;
    camas_ocupadas number;
    numero_random number;
begin

    select count(*) into cantidad_asistencia from Estatus_Persona ep, Persona p, lugar l, lugar u
    where ep.fk_persona=p.id and p.fk_lugar=l.id and l.fk_lugar=u.id and u.id=lugar_id and ep.fk_estatus=2;


    IF (modelo=1) THEN
        cantidad_asistencia:=round(cantidad_asistencia *0.5);
    ELSE
        cantidad_asistencia:=round(cantidad_asistencia *0.05);    
    END IF;

     DBMS_OUTPUT.PUT_LINE('------------LLENAR CENTROS-----------');
    WHILE(cantidad_asistencia!=0)
    LOOP

        select fk_persona into paciente_id 
        from (select ep.fk_persona,ep.fk_centro_atencion
        from Estatus_Persona ep, Persona p , lugar l, lugar u
        where ep.fk_estatus=2 and ep.fk_persona=p.id and p.fk_lugar=l.id and l.fk_lugar=u.id and u.id=lugar_id 
        and ep.fk_centro_atencion is null order by dbms_random.value ) 
        where rownum=1;

            select id, nro_camas_totales,nro_camas_ocupadas into centro_id,camas_totales,camas_ocupadas from (
            select id, nro_camas_totales,nro_camas_ocupadas from centro_atencion 
            where fk_lugar=lugar_id order by dbms_random.value)
            where rownum<=1;

            IF(camas_totales!=camas_ocupadas) THEN
                update Estatus_Persona 
                set fk_centro_atencion=centro_id
                where fk_persona=paciente_id;

                dbms_output.put_line('La persona con ID: '|| paciente_id || ' , esta siendo tratada en el centro ID: '||centro_id || ' ,el dia: ' ||fecha );

                update Centro_Atencion
                set nro_camas_ocupadas=nro_camas_ocupadas+1
                where id=centro_id;

                update Sintoma_Persona
                    set atencion_medica='V'
                where fk_persona=paciente_id;
            ELSE
                 select dbms_random.value(0,1) into numero_random from dual;

                 if(numero_random>0.8) then
                    dbms_output.put_line('--------------------EL sistema colapso o sigue colapsado. INFO-'||' ID CENTRO: '|| centro_id || ' FECHA: '||fecha || '-----------------' );
                 end if;

            END IF;

        cantidad_asistencia:=cantidad_asistencia-1;
    END LOOP;

    return true;

    exception
      when no_data_found then
        return false;
end;

/
--------------------------------------------------------
--  DDL for Function MUERTES
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ADMIN"."MUERTES" (lugar_id number,modelo number,fecha date) return boolean is

centro_id number;
cantidad_infectados number;
muerte_id number;
cantidad_patologias number;
numero_random number;
numero_random2 number;
dias number;
begin


    select count(fk_persona) into cantidad_infectados from(select count(sp.id), sp.fk_persona, p.fk_lugar, ep.fk_estatus 
    from Sintoma_Persona sp,Persona p, Estatus_Persona ep , lugar l, lugar u
    where p.id=sp.fk_persona and ep.fk_persona=p.id and ep.fk_estatus!=4 and ep.fk_estatus!=3 and p.fk_lugar=l.id 
    and l.fk_lugar=u.id and u.id=lugar_id
    group by(sp.fk_persona,p.fk_lugar,ep.fk_estatus) 
    having count(*)>=4 
    order by fk_persona);

    if(modelo=1)then
        cantidad_infectados:=round((cantidad_infectados*0.02));
    else
        cantidad_infectados:=round((cantidad_infectados*0.01)); 
    end if;
         DBMS_OUTPUT.PUT_LINE('------------MUERTES-----------');
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

                dbms_output.put_line('La persona con ID: '|| muerte_id || ' , fallece en los prox '||dias|| ' dias de la fecha: '||fecha );
                cantidad_infectados:=cantidad_infectados-1;
        end loop;

    return true;

    exception
      when no_data_found then
        return false; 

end;

/
--------------------------------------------------------
--  DDL for Function RECUPERAR
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ADMIN"."RECUPERAR" (lugar_id number,modelo number,fecha date) return boolean is
cantidad_recuperacion number;
caso1 number;
caso2 number;
persona_id number;
centro_id number;
numero_random number;

begin

    select count(*) into cantidad_recuperacion from Estatus_Persona ep, Persona p, lugar l, lugar u
    where ep.fk_persona=p.id and p.fk_lugar=l.id and l.fk_lugar=u.id and u.id=lugar_id and ep.fk_estatus=2;

    if(modelo=1) then
        caso1:=round((cantidad_recuperacion*0.025));
        caso2:=round((cantidad_recuperacion*0.025));
    else
        caso1:=round((cantidad_recuperacion*0.010));
        caso2:=round((cantidad_recuperacion*0.010));
    end if;

    cantidad_recuperacion:= caso1 + caso2;
         DBMS_OUTPUT.PUT_LINE('------------RECUPERACION-----------');
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
                    dbms_output.put_line('La persona con ID: '|| persona_id || ' , no aguanto el tratamiento y muere en los prox 15 dias de la fecha: ' ||fecha );

                else if(numero_random<0.7 and numero_random>=0.3) then
                    update Estatus_Persona
                    set fk_estatus=3,fecha_recuperacion=fecha+7
                    where fk_persona=persona_id;

                    update Centro_Atencion
                    set nro_camas_ocupadas=nro_camas_ocupadas-1
                    where id=centro_id;

                     dbms_output.put_line('La persona con ID: '|| persona_id || ' , se recupera en los prox 7 dias de la fecha: ' ||fecha );

                else if(numero_random<0.3) then   
                    update Estatus_Persona
                    set fk_estatus=3,fecha_recuperacion=fecha+2
                    where fk_persona=persona_id;

                    update Centro_Atencion
                    set nro_camas_ocupadas=nro_camas_ocupadas-1
                    where id=centro_id;

                    dbms_output.put_line('La persona con ID: '|| persona_id || ' , se recupera en los prox 2 dias de la fecha: ' ||fecha );

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

/
--------------------------------------------------------
--  DDL for Function VIAJES
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ADMIN"."VIAJES" (modelo number, lugar_id number, fecha date) return boolean
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
        cantidad_viajeros:=round(cantidad_viajeros*0.15);
    else
        cantidad_viajeros:=round(cantidad_viajeros*0);
    end if;
     DBMS_OUTPUT.PUT_LINE('------------VIAJES-----------');
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
                    select dbms_random.value(16,40) into lugar_destino from dual; --CAMBIAR DE 16,65 PARA SIMULACION COMPLETA
                    lugar_destino:=round(lugar_destino);
                    EXIT WHEN(lugar_destino!=lugar_origen);
                END LOOP;

                if (true)  then

                    select id_pasajero into pasajero_id from persona where id=persona_id;

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

                    dbms_output.put_line('La persona con ID: '|| persona_id || ' ,viaja al pais con id: ' ||lugar_origen || ' con destino al pais con id: '|| lugar_destino  );
                    insert into Viaje (id, fecha_inicio, fk_pasajero, fk_origen, fk_destino, fk_avion) values (sec_viaje.nextval, TO_DATE(fecha,'DD/MM/YYYY'),pasajero_id, lugar_origen,lugar_destino,avion_id);

                else
                    dbms_output.put_line ('Fronteras y vuelos cerrados en pais destino'); 
                end if;


          cantidad_viajeros:=cantidad_viajeros-1;      
        end loop;

    end if;

        return true;

        exception
          when no_data_found then
            return false;


end;

/


/*---------------------Ejecutar simulacion------------------*/
set serveroutput on size unlimited;
execute iniciar_simulacion('27/05/2020');