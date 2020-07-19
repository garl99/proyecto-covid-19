
------------------------------------------------------------------------

select count(sp.id), sp.fk_persona, p.fk_lugar, ep.fk_estatus 
from Sintoma_Persona sp,Persona p, estatus_persona ep, lugar l, lugar u
where p.id=sp.fk_persona and p.id=ep.fk_persona and ep.fk_estatus=1 and p.fk_lugar=l.id and l.fk_lugar=u.id and u.id=7
group by sp.fk_persona, p.fk_lugar, ep.fk_estatus 
having count(*)>=4 order by fk_persona;

select * from centro_atencion;
select SUM(nro_camas_ocupadas) from centro_atencion;
select count(*) from Estatus_Persona where fk_estatus=3;

select * from Estatus_Persona where fk_estatus=2;

select  count(*) from viaje;
select count(*),fk_pasajero from viaje group by fk_pasajero;

select  l.info_cantidad.cantidad_infectados,
        l.info_cantidad.cantidad_recuperados,
        l.info_cantidad.cantidad_fallecidos,
        l.info_cantidad.porcentaje_infectados,
        l.info_cantidad.porcentaje_recuperados,
        l.info_cantidad.porcentaje_fallecidos
from lugar l
where l.id=6;


select * from Estatus_Persona ep, persona p, lugar l, lugar u 
where  ep.fk_estatus=4 and ep.fk_persona=p.id and p.fk_lugar=l.id and ep.fecha_infeccion is not null and l.fk_lugar=u.id and u.id=6;

select * from Registro where fk_lugar=6;

select * from Estatus_Persona ep, persona p, lugar l, lugar u 
where  ep.fk_estatus=4 and ep.fk_persona=p.id and p.fk_lugar=l.id and ep.fecha_infeccion is not null and l.fk_lugar=u.id and u.id=6;


------------------------------------------------------------------------


update centro_atencion set nro_camas_ocupadas=0;
delete from viaje where id>15;
delete from sintoma_persona where id>2500;
update Estatus_Persona set fk_centro_atencion=null,fecha_fallecimiento=null,fecha_infeccion=null,fecha_recuperacion=null,fk_estatus=1;
delete from registro;
update centro_insumo set cantidad=250;
delete from registro where id>15;
delete from modelo_lugar where id>15;
delete from ayuda_insumo where id>15;
delete from ayuda_humanitaria where id>15;



------------------------------------------------------------------------


delete from sintoma_Persona;
delete from Estatus_Persona;
delete from Patologia_Persona;
delete from Persona;


drop sequence sec_persona;
drop sequence sec_patologia_persona;
drop sequence sec_sintoma_persona;
drop sequence sec_estatus_persona;

create sequence sec_persona
start with 1
increment by 1;
create sequence sec_patologia_persona
start with 1
increment by 1;
create sequence sec_sintoma_persona
start with 1
increment by 1;
create sequence sec_estatus_persona
start with 1
increment by 1;

