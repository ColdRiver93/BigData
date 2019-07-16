drop table bd1;
drop table bd2;

create table bd1 (prov_insc varchar,cant_insc varchar,parr_insc varchar,
				  anio_insc varchar,mes_insc varchar,dia_insc varchar,fecha_insc varchar,
				  sexo varchar,anio_nac varchar,mes_nac varchar,dia_nac varchar,fecha_nac varchar,
				  talla varchar,peso varchar,sem_gest varchar,tipo_part varchar,
				  apgar1 varchar,apgar5 varchar,p_emb varchar,lugar_ocur varchar,prov_nac varchar,cant_nac varchar,
				  parr_nac varchar,area_nac varchar,asis_por varchar,nac_mad varchar,cod_pais varchar,
				  anio_mad varchar,mes_mad varchar,dia_mad varchar,fecha_mad varchar,edad_mad varchar,
				  con_pren varchar,num_emb varchar,num_par varchar,hij_viv varchar,hij_vivm varchar,
				  hij_nacm varchar,etnia varchar,est_civil varchar,niv_inst varchar,sabe_leer varchar,
				  prov_res varchar,cant_res varchar,parr_res varchar,area_res varchar,residente varchar);
				  
--33 secs 377 msec.
COPY bd1 FROM 'C:\Users\Juan Riofrio\Desktop\ABD\Datos_abiertos_ENV_2017\ENV_2017.csv'
DELIMITERS ',' CSV header encoding 'windows-1251';

select count(*) from bd1;
select * from bd1 where random() < 0.01 limit 10;


select sexo, talla, peso, sem_gest, tipo_part, edad_mad from bd1
where sexo != 'Sin informaciуn' and talla  != 'Sin informaciуn' and
	  peso != 'Sin informaciуn' and sem_gest != 'Sin informaciуn' and
	  tipo_part != 'Sin informaciуn' and edad_mad != 'Sin informaciуn';

create table bd2 as select sexo, talla, peso, sem_gest, tipo_part, edad_mad from bd1
where sexo != 'Sin informaciуn' and talla  != 'Sin informaciуn' and peso != 'Sin informaciуn'and
      sem_gest != 'Sin informaciуn' and tipo_part != 'Sin informaciуn' and edad_mad != 'Sin informaciуn';

select count(*) from bd2;
select * from bd2 where random() < 0.01 limit 10;

update bd2 set tipo_part = 0 where tipo_part = 'Normal';
update bd2 set tipo_part = 1 where tipo_part = 'Cesбrea';
select * from bd2 where tipo_part != '0' and tipo_part != '1';

update bd2 set sexo = 0 where sexo = 'Hombre';
update bd2 set sexo = 1 where sexo = 'Mujer';
select * from bd2 where sexo != '0' and sexo != '1';

select * from bd2 where random() < 1000 limit 100;
select * from bd2 where peso::integer <600;
select * from bd2 where sexo = '1';
select * from bd2 where tipo_part='1' and sexo = '1';

COPY bd2 TO 'C:\Users\Juan Riofrio\Desktop\ABD\Datos_abiertos_ENV_2017\clean_data.csv' DELIMITER ',' CSV HEADER;