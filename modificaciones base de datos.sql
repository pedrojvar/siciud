create table par_externo (pexidpar int references b_pares, pexinstitucion varchar, pexhojavida varchar)
ALTER TABLE par_externo DROP CONSTRAINT par_externo_pexidpar_fkey;
ALTER TABLE par_externo ADD CONSTRAINT fk_parext FOREIGN KEY (pexidpar) REFERENCES b_pares (beidpersona)    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE par_area DROP CONSTRAINT fk_par;
ALTER TABLE par_area ADD CONSTRAINT fk_par FOREIGN KEY (paidpar) REFERENCES b_pares (beidpersona)    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE convocatoria ADD COLUMN convresapertura varchar;

CREATE SEQUENCE sec_consecutivo_si;
CREATE TABLE item_perfil(ipiditem int references b_item_categoria, ipidperfil int references b_perfiles);
CREATE TABLE b_reporte_mail(rpmid serial, rpmcodigo varchar, rpmfecha varchar, rpmdestinatario varchar,rpmtipomail varchar,rpmcorreo varchar,rpmusuario varchar,CONSTRAINT b_reporte_mail_pkey PRIMARY KEY (rpmid));
create table conv_porcent_eval (cpeidconv int references convocatoria, cpeporcentint int,cpeporcentext int,cpeaspectcomite varchar)


pagina para crear gif de cargando
http://www.ajaxload.info/