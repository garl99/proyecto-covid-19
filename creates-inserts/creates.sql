create or replace type Rango_Fecha as object(
    fecha_inicio date,
    fecha_final date,
    static function validar_fecha(fecha_inicio date, fecha_final date) return boolean
);

create or replace type Info_Cantidad as object(
    cantidad_recuperados number,
    cantidad_infectados number,
    cantidad_fallecidos number,
    porcentaje_recuperados float,
    porcentaje_infectados float,
    porcentaje_fallecidos float,
    static function calcular_porcentaje(cantidad number, n_poblacion number) return number
);

create or replace type Info_Persona as object(
    primer_nombre varchar2(20),
    segundo_nombre varchar2(20),
    primer_apellido varchar2(20),
    segundo_apellido varchar2(20),
    fecha_nacimiento date,
    genero char(1),
    static function calcular_edad(fecha_nacimiento date) return number,
    static function cantidad_sintomas(id number) return number
);

/*-------------------------------------------------------------*/

create table Lugar(
    id number primary key,
    nombre varchar2(20) not null,
    tipo varchar2(15) not null,
    n_poblacion number not null,
    bandera BLOB,
    info_cantidad Info_Cantidad,
    fk_lugar number,
    constraint FK_fk_lugar foreign key (fk_lugar) references Lugar(id)
); 

create table Patologia(
    id number primary key,
    nombre varchar2(20) not null
);

create table Persona(
    id number primary key,
    info_persona Info_Persona,
    foto BLOB not null,
    id_pasajero number unique,
    tipo varchar2(15) not null,
    fk_lugar number,
    constraint CK_persona_pasajero check (tipo in ('persona', 'pasajero')),
    constraint FK_fk_lugar_persona foreign key (fk_lugar) references Lugar(id)
);

create table Patologia_Persona(
    id number primary key,
    fk_patologia number not null,
    fk_persona number not null,
    constraint FK_fk_patologia foreign key (fk_patologia) references Persona(id)
);


create table Sintoma(
    id number primary key,
    nombre varchar2(50) not null
);


create table Sintoma_Persona(
    id number primary key,
    fecha_sintoma date not null,
    atencion_medica char(1),
    fk_sintoma number not null,
    fk_persona number not null,
    constraint FK_fk_sintoma foreign key (fk_sintoma) references Sintoma(id),
    constraint FK_fk_sintoma_persona foreign key (fk_persona) references Persona(id)

);

create table Centro_Atencion(
    id number primary key,
    nombre varchar2(20) not null,
    direccion varchar2(50) not null,
    info_cantidad Info_Cantidad,
    tipo varchar2(15) not null,
    nro_camas_totales number not null,
    nro_camas_ocupadas number not null,
    fk_lugar number not null,
    constraint FK_fk_lugar_centro foreign key (fk_lugar) references Lugar(id)   
);

create table Insumo(
    id number primary key,
    nombre varchar2(50) not null
);

create table Centro_Insumo(
    id number primary key,
    cantidad number not null,
    fk_centro_atencion number not null,
    fk_insumo number not null,
    constraint FK_fk_centro_atencion foreign key (fk_centro_atencion) references Centro_Atencion(id),
    constraint FK_fk_insumo_centro foreign key (fk_insumo) references Insumo(id)
);

create table Ayuda_Humanitaria(
    id number primary key,
    fecha_donacion date not null,
    cantidad_dinero number not null,
    fk_pais_donador number not null,
    fk_pais_ayudado number not null,
    constraint FK_fk_pais_donador foreign key (fk_pais_donador) references Lugar(id),
    constraint FK_fk_pais_ayudado foreign key (fk_pais_ayudado) references Lugar(id)
);

create table Ayuda_Insumo(
    id number primary key,
    cantidad number not null,
    fk_insumo number not null,
    fk_ayuda_humanitaria number not null,
    constraint FK_fk_insumo_ayuda foreign key (fk_insumo) references Insumo(id),
    constraint FK_fk_ayuda_humanitaria foreign key (fk_ayuda_humanitaria) references Ayuda_Humanitaria(id)
);

create table Aerolinea(
    nombre varchar2(20) primary key,
    n_flota number not null,
    logo BLOB
);

create table Avion(
    id number primary key,
    modelo varchar2(10) not null,
    fecha number,
    n_motores number,
    fk_aerolinea varchar2(20),
    constraint FK_fk_aerolinea foreign key (fk_aerolinea) references Aerolinea(nombre)
);

create table Viaje(
    id number primary key,
    fecha_inicio date,
    fk_pasajero number not null,
    fk_origen number not null,
    fk_destino number not null,
    fk_avion number not null,
    constraint FK_fk_pasajero foreign key (fk_pasajero) references Persona(id_pasajero),
    constraint FK_fk_origen foreign key (fk_origen) references Lugar(id),
    constraint FK_fk_destino foreign key (fk_destino) references Lugar(id),
    constraint FK_fk_avion foreign key (fk_avion) references Avion(id)
);

create table Estatus(
    id number primary key,
    nombre varchar2(15) not null
);

create table Estatus_Persona(
    id number primary key,
    fecha_infeccion date,    
    fecha_fallecimiento date,
    fecha_recuperacion date,
    fk_estatus number not null,
    fk_persona number not null,
    fk_centro_atencion number,
    constraint FK_fk_estatus foreign key (fk_estatus) references Estatus(id),
    constraint FK_fk_persona_estatus foreign key (fk_persona) references Persona(id),
    constraint FK_fk_centro_atencion_estatus foreign key (fk_centro_atencion) references Centro_Atencion(id)
);

create table Frontera(
    id number primary key,
    rango_fecha Rango_Fecha,
    longitud number not null,
    fk_lugar number,
    constraint FK_fk_lugar_frontera foreign key (fk_lugar) references Lugar(id)
);

create table Modelo(
    id number primary key,
    nombre varchar2(15) not null 
);

create table Proveedor_Internet(
    id number primary key,
    nombre varchar2(20) not null,
    fecha date not null,
    velocidad_subida float not null,
    velocidad_bajada float not null,
    horas_interrupcion float,
    logo BLOB
);

create table Lugar_Proveedor(
    id number primary key,
    fk_proveedor number not null,
    fk_lugar number not null,
    constraint FK_fk_proveedor foreign key (fk_proveedor) references Proveedor_Internet(id),
    constraint FK_fk_lugar_proveedor foreign key (fk_lugar) references Lugar(id)
);


create table Modelo_Lugar(
    id number primary key,
    rango_fecha Rango_Fecha,
    fk_modelo number not null,
    fk_lugar number not null,
    constraint FK_fk_modelo foreign key (fk_modelo) references Modelo(id),
    constraint FK_fk_lugar_modelo foreign key (fk_lugar) references Lugar(id)
);
