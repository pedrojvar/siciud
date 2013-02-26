create user admin_cidc encrypted password 'cpnatas40' superuser;
create user visitante_cidc encrypted password 'cpnatas40' superuser;
create user comite_cidc encrypted password 'cpnatas40' superuser;
create user func_a_cidc encrypted password 'cpnatas40' superuser;
create user func_b_cidc encrypted password 'cpnatas40' superuser;
create user func_c_cidc encrypted password 'cpnatas40' superuser;
create user func_d_cidc encrypted password 'cpnatas40' superuser;
create user func_e_cidc encrypted password 'cpnatas40' superuser;
create user investigador_cidc encrypted password 'cpnatas40' superuser;
create user evaluador_cidc encrypted password 'cpnatas40' superuser;
create user direc_grupo_cidc encrypted password 'cpnatas40' superuser;
create user evaluador3_cidc encrypted password 'cpnatas40' superuser;

select convano||'-'||convnumero,brubnombre,convcuantia,convrubvalor,(cast ( convcuantia as integer )*(cast(convrubvalor as float)/100)) from convocatoria,conv_rubros,b_rubros where convid=idconv and convidrub=brubid order by convano||'-'||convnumero
select * from b_perfiles
insert into b_perfiles (bpernombre,bperdescripcion) values('Asistente 4','Gestion Documentos');
update b_perfiles set bperdescripcion='Director del Centro de Investigaciones' where bperfid=2

insert into grupo_servicios (grservnombre) values('Convocatorias');
insert into servicios (servnombre,servgrupo,servpunto)values('Creaci�n',1,'/paginas/homeCOnvocatorias.jsp');
insert into servicio_perfil values(1,1)
insert into personal (pernumdoc,pertipodoc,pernombres,perapellidos,permail,perdireccion,pertelefono,percelular) values(80897341,'cc','Oscar Javier','Angel S�nchez','oskrjavier@gmail.com','Cll 60 a sur # 71 I 15','7765028','3002369227')
insert into persona_perfil values(1,1);
insert into usuario_sistema values('oscar',1)

insert into b_eval_criterios (bevalcrinombre) values ('CALIDAD');
insert into b_eval_criterios (bevalcrinombre) values ('COMPETENCIA');
insert into b_eval_criterios (bevalcrinombre) values ('RACIONALIDAD');
insert into b_eval_criterios (bevalcrinombre) values ('PERTINENCIA');
insert into b_eval_criterios (bevalcrinombre) values ('COBERTURA');




/********************* primer criterio *******************************************************/
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (1,'Claridad conceptual: coherencia interna, calidad en la refacci�n, distinci�n de corrientes te�ricas y encuadre desde teor�as o enfoques te�ricos.','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (1,'Actualidad de fuentes bibliograficas y documentales','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (1,'Grado de acierto en el planteamiento del problema','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (1,'Pertinencia metodol�gica: enfoque adecuado, dise�o y estrategias pertinentes','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (1,'Adecuacion de la hhip�tesis: formulaci�n adecuada de las hip�tesis con relaci�n al problema','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (1,'Pertinencia de los objetivos: formulaci�n de los objetivos acordes con la naturaleza y posibilidades de la investigaci�n','');

insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (2,'Aportes posibles al conocimiento','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (2,'Innovaci�n','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (2,'Posibles beneficios al entorno','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (2,'Vinculacion intersectorial y/o interinstitucional','');

insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (3,'Claridad en el planteamiento del problema de investigaci�n','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (3,'Claridad y pertinencia del marco referencial o te�rico del proyecto','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (3,'Claridad en el planteamiento del objetivo general','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (3,'Claridad en el planteamiento de los objetivos espec�ficos','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (3,'Claridad y pertinencia en el planteamiento metodol�gico propuesto ','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (4,'Calidad y pertinencia en los aportes en la generaci�n de nuevo conocimiento','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (4,'Calidad y pertinencia de los impactos previstos para el proyecto de investigaci�n e identificaci�n clara de sus posibles beneficiarios','');
insert into b_eval_aspectos (bevalidcrit,bevalaspnombre,bevalaspdescripcion) values (5,'Nivel de coherencia entre el presupuesto solicitado y el proceso metodol�gico planteado para la propuesta de investigaci�n','');

insert into conv_ejes values(?,?);
insert into conv_compromisos values(?,?);
select *from b_eval_criterios
select *from b_eval_aspectos
select *from convocatoria
select convid,convano,convnumero, convnombre from convocatoria


select bperfid,pernombres,perapellidos,servpunto from usuario_sistema,personal,persona_perfil,servicios,servicio_perfil where usid='oscar' and usidpersona=perid and bperidpersona=perid and serperperfid=perid and serperservicio=servid;

select * from servicios
update servicios set servpunto='/Administrador/home.jsp' where servid=1


insert into b_compromisos (bcompproducto,bcompindicador) values ('Al menos 1 producto de nuevo conocimiento','');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Formacion de m�nimo 2 estudiantes de maestr�a de programas de la Universidad Distrital','Tesis de grado entregadas al Concejo Curricular del programa');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Formacion de m�nimo 2 estudiantes de Pregrado de programas de la Universidad Distrital','Pasant�a de investigacion o trabajo de grado en modalidad investigaci�n o tradicional entregado al Consejo Curricular del programa');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Vinculacion de j�venes investigadores Colciencias','Aprobaci�n en Convocatoria COLCIENCIAS');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Propoesta de programa de postgrado (maestr�a o doctorado) para la Uuniversidad Distrital','Recibido de propuesta por Consejo de Facultad');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Formulaci�n de programa o l�nea de investigaci�n de maestr�a o doctorado basado en los resultados de investigaci�n y en la trayectoria del grupo','Documento conceptual radicado en el Consejo Curricular o de Facultad');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Cursos o seminarios de maestr�a o doctorado para programas acad�micos de la Universidad Distrital, basado en los resultados de investigaci�n y en la trayectoria del grupo ','Documento conceptual radicado en el Consejo Curricular o de Facultad');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Programa para el fortalecimiento de las actividades de investigaci�n formativa para proyectos curriculares de la univesidad','Documento conceptual entregado al Proyecto Curricular');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Curso de extensi�n o servicio t�cnico basado en los resultados del proyecto','Documento conceptual radicado en la unidad de extensi�n de la Facultad o en el Instituto de la Universidad');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Organizaci�n del evento cient�fico o tecnol�gico o presentaci�n de ponencia basada en los resultados de investigaci�n','Documento conceptual y organizativo del evento. Certificaci�n participaci�n ponente');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Compromisos recursos externos vigencias 2006 o 2007','Certificaciones entidades externas');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Postulaci�n de un art�culo de resultado a la Revista Cient�fica','Certificaci�n director Revista');
insert into b_compromisos (bcompproducto,bcompindicador) values ('Direccion de minimo una tesis doctoral','Un proyecto de tesis doctoral certificado por el Consejo Curricular del Doctorado o el organismo que actue como tal.');

insert into b_ejes_tematicos(ejenombre,ejeobjetivo)values('Herramientas para la democratizaci�n del conocimiento','');
insert into b_ejes_tematicos(ejenombre,ejeobjetivo)values('Mejoramiento de la callidad de vida en Bogot�, Ciudad-Regi�n','');
insert into b_ejes_tematicos(ejenombre,ejeobjetivo)values('Gesti�n del riesgo','');

select *from b_ejes_tematicos
select *from conv_ejes
select *from b_eval_aspectos
select bejeid,ejenombre from b_ejes_tematicos,conv_ejes where idconv=1 and ideje=bejeid
select idcrit,idaspec,bevalaspnombre,baspvalor from conv_aspectos,b_eval_aspectos where idconv=1 and idaspec=bevalaspid
select *from conv_criterios
select bevalcriid,bevalcrinombre,bcrivalor from b_eval_criterios, conv_criterios where bevalcriid=idcrit and idconv=1
select bcompid from b_compromisos
select bcompid,bcompproducto from b_compromisos
select bevalaspid,bevalidcrit,bevalaspnombre from b_eval_aspectos
insert into conv_criterios values(1,1,45);
insert into conv_aspectos values(1,1,1,10);
insert into conv_aspectos values(1,1,2,24);
insert into conv_aspectos values(1,1,5,24);
insert into conv_aspectos values(1,2,2,24);
insert into conv_ejes values(1,3);
select bevalcriid,bevalcrinombre,bcrivalor from b_eval_criterios, conv_criterios where bevalcriid=idcrit and idconv=1
select bevalcriid,bevalcrinombre,bcrivalor from b_eval_criterios, conv_criterios where bevalcriid=idcrit and idconv=1


insert into b_rubros (brubnombre) values ('Personal');
insert into b_rubros (brubnombre) values ('Papeleria');
insert into b_rubros (brubnombre) values ('Viajes');
insert into b_rubros (brubnombre) values ('Transporte');
insert into b_rubros (brubnombre) values ('Equipos de c�mputo');
insert into b_rubros (brubnombre) values ('Trabajo de Campo');
insert into b_rubros (brubnombre) values ('Bibliograf�a Publicaciones e Impresos');
insert into b_rubros (brubnombre) values ('Software');
insert into b_rubros (brubnombre) values ('Servicios T�cnicos');
insert into b_rubros (brubnombre) values ('Asesorias');
insert into b_rubros (brubnombre) values ('Materiales Fungibles');
insert into b_rubros (brubnombre) values ('Construcciones');
insert into b_rubros (brubnombre) values ('Mantenimiento y Suministros');
insert into b_rubros (brubnombre) values ('Administraci�n');
insert into b_rubros (brubnombre) values ('Otros');
insert into b_rubros (brubnombre) values ('Participaci�n en eventos nacionales');
insert into b_rubros (brubnombre) values ('Participaci�n en eventos Internacionales');

select *from b_rubros
select *from cidc_grup_semill

select *from b_investigadores
select *from b_facultades

create table b_investigadores(binvidper int primary key, binvidfac int references b_facultades, binvidgrupoinv int references cidc_grup_semill);

select pernombres,cgsid from personal,cidc_grup_semill,b_investigadores where cgsid=binvidgrupoinv and perid=binvidper and binvidper=2
select cgsid, cgsnombre from cidc_grup_semill where cgsfacultad=1
select distinct perid,pernombres,perapellidos from b_investigadores,personal where perid=binvidper and binvidgrupoinv=2

insert into b_facultades(bfacnombre) values('Facultad de Ingenier�a');
insert into b_facultades(bfacnombre) values('Facultad Tecnol�gica');
insert into b_facultades(bfacnombre) values('Facultad de Medio Ambiente y Recursos Naturales');
insert into b_facultades(bfacnombre) values('Facultad de Ciencias y Educaci�n');
insert into b_facultades(bfacnombre) values('Facultad de Artes (ASAB)');

insert into cidc_grup_semill (cgscodigo,cgsnombre,cgssiglas,cgsfacultad) values(11,'Grupo de investigaci�n Metis','Metis',1);
insert into cidc_grup_semill (cgscodigo,cgsnombre,cgssiglas,cgsfacultad) values(12,'Grupo de investigaci�n en Rob�tica Movil','Roma',1);
insert into personal (pernumdoc,pertipodoc,pernombres,perapellidos,permail,perdireccion,pertelefono,percelular) values(80897341,'cc','Oscar Javier','Angel S�nchez','oskrjavier@gmail.com','cll 60 a sur # 71 I 15','7765028','3012369227');
insert into personal (pernumdoc,pertipodoc,pernombres,perapellidos,permail,perdireccion,pertelefono,percelular) values(53897341,'cc','Johanna Andrea','Buitrago Buitrago','jabjohanna@gmail.com','cll 60 a sur # 71 I 15','7765028','3113061712');

truncate table cidc_grup_semill
insert into b_investigadores values(1,2,1);
insert into b_investigadores values(4,2,2);


select brubid, brubnombre, brubvalor from b_rubros,conv_rubros where brubid=idrub and idconv=22

select nvl(max(ARTGRUCODIGO),0)+1 from ART_GRUPO
select (max(inscid)+1) from inscrip_propuesta

select nextval(inscrip_propuesta_inscid_seq)
select last_value from reporte_rae
select nextval ('inscrip_propuesta_inscid_seq')
SELECT setval('sec_consecutivo_contrato', 1);
SELECT setval('polla_pid_seq', 1);

SELECT setval('sec_consecutivo_contrato', 46);

********acta de inicio**********************
SELECT setval('sec_consecutivo_actaini', 39);

SELECT currval('inscrip_propuesta_inscid_seq');
select last_value from sec_consecutivo_contrato;

insert into b_lineas_investigacion (blinnombre) values('Desarrollo de plataformas m�viles');
insert into b_lineas_investigacion (blinnombre) values('Desarrollo de sistemas aut�nomos');
insert into b_lineas_investigacion (blinnombre) values('Desarrollo de sistemas sensoriales');
insert into b_lineas_investigacion (blinnombre) values('Nuevas tecnolog�as de la informaci�n');
insert into b_lineas_investigacion (blinnombre) values('Gestion estrategica de tecnologia informatica');
insert into b_lineas_investigacion (blinnombre) values('Educacion Virtual');
insert into b_lineas_investigacion (blinnombre) values('Gestion de Conocimiento');
insert into b_lineas_investigacion (blinnombre) values('Sistemas de Informacion');
insert into b_lineas_investigacion (blinnombre) values('Algoritmos num�ricos paralelos');
insert into b_lineas_investigacion (blinnombre) values('Computaci�n en Malla');
insert into b_lineas_investigacion (blinnombre) values('Desarrollo y administraci�n de servidores Web');
insert into b_lineas_investigacion (blinnombre) values('Programaci�n Paralela');
insert into b_lineas_investigacion (blinnombre) values('Redes Inal�mbricas');
insert into b_lineas_investigacion (blinnombre) values('Redes de transmisi�n de datos');
insert into b_lineas_investigacion (blinnombre) values('Sistemas Distribuidos');
insert into b_lineas_investigacion (blinnombre) values('Tecnolog�a de Componentes y Servicios Web');
insert into b_lineas_investigacion (blinnombre) values('Nuevos materiales en el sector constructivo');
insert into b_lineas_investigacion (blinnombre) values('Dise�o conceptual de productos y creatividad t�cnica');
insert into b_lineas_investigacion (blinnombre) values('Dise�o de productos de alta sofisticaci�n t�cnica');
insert into b_lineas_investigacion (blinnombre) values('Nuevos materiales aplicados al dise�o mec�nico');
insert into b_lineas_investigacion (blinnombre) values('Recuperaci�n t�cnica de dise�os tradicionales o populares');
insert into b_lineas_investigacion (blinnombre) values('Usabilidad en nuevos productos');


------------Facultad de Educaci�n----------------------------------------
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(188,4,'LICENCIATURA EDUACION BASICA CON ENFASIS EN EDUCACION ARTISTICA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(40,4,'LICENCIATURA EN BIOLOGIA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(140,4,'LICENCIATURA EN BIOLOGIA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(155,4,'LICENCIATURA EN EDUCACION BASICA CON ENFASIS EN CIENCIAS SOCIALES',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(165,4,'LICENCIATURA EN EDUCACION BASICA CON ENFASIS EN ING, LENGUA EXTRANJERA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(160,4,'LICENCIATURA EN EDUCACION BASICA CON ENFASIS EN LENGUA CASTELLANA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(145,4,'LICENCIATURA EN EDUCACION BASICA CON ENFASIS EN MATEMATICAS',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(65,4,'LICENCIATURA EN ESPANOL-INGLES',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(35,4,'LICENCIATURA EN FISICA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(135,4,'LICENCIATURA EN FISICA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(60,4,'LICENCIATURA EN LINGUISTICA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(45,4,'LICENCIATURA EN MATEMATICAS',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(187,4,'LICENCIATURA EN PEDAGOGIA INFANTIL',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(75,4,'LICENCIATURA EN PRIMARIA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(50,4,'LICENCIATURA EN QUIMICA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(150,4,'LICENCIATURA EN QUIMICA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(55,4,'LICENCIATURA EN SOCIALES',1);


-------------facultad Tecnol�gica-------------------------------------------
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(279,1,'INGENIERIA CIVIL',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(177,1,'INGENIERIA DE PRODUCCION',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(283,1,'INGENIERIA EN CONTROL',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(272,1,'INGENIERIA DISTRIBUCION Y REDES ELECTRICAS',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(273,1,'INGENIERIA EN TELECOMUNICACIONES',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(378,1,'INGENIERIA EN TELEMATICA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(274,1,'INGENIERIA MECANICA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(77,1,'TECNOLOGIA EN INDUSTRIAL',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(73,1,'TECNOLOGIA EN ELECTRONICA',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(79,1,'TECNOLOGIA CONSTRUC. CIVILES',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(72,1,'TECNOLOGIA EN ELECTRICIDAD',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(78,1,'TECNOLOGIA SISTEMATIZACION DE DATOS',1);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(74,1,'TECNOLOGIA EN MECANICA',1);


insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(,1,'',true);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(,1,'',true);
insert into b_proyecto_curricular (bpccodigo,bpccodfacultad,bpcnombre,estado) values(,1,'',true);


insert into usuario_sistema (usidpersona,usnick,usclave,usidperfil)values(1,'oskr','qwerty',1);
select pernombres || perapellidos, usnick, bpernombre from usuario_sistema, personal, b_perfiles where usidperfil=bperid and perid=usidpersona;

----------------------------consulta de recursos-------------------------------------------
select * from recursos where ridperfil=? AND rprimario=true
select * from recursos where riditem=?

insert into b_estado_prupuesta values(1,'Sin Asignaci�n');
insert into b_estado_prupuesta values(2,'Asignado - Esperando Respuesta');
insert into b_estado_prupuesta values(3,'Asignado - Acept�');
insert into b_estado_prupuesta values(4,'Documentos Entregados');
insert into b_estado_prupuesta values(5,'Evaluaci�n Entregada');


select current_date as fecha
select to_char(current_timestamp,'HH12:MI:SS') as hora
select current_date as fecha,to_char(current_timestamp,'HH12:MI:SS') as hora

insert into b_superarea (sanombre) values('Ciencias Agrarias');
insert into b_superarea (sanombre) values('Ciencias Biol�gicas');
insert into b_superarea (sanombre) values('Ciencias Exactas y de la Tierra');
insert into b_superarea (sanombre) values('Ciencias Humanas');
insert into b_superarea (sanombre) values('Ciencias Sociales Aplicadas');
insert into b_superarea (sanombre) values('Ciencias de la Salud');
insert into b_superarea (sanombre) values('Ingenier�as');
insert into b_superarea (sanombre) values('Linguistica Letras y Artes');
insert into b_superarea (sanombre) values('Otros');


insert into b_areatrabajo (atsuper,atnombre) values(1,'Agronom�a');
insert into b_areatrabajo (atsuper,atnombre) values(1,'Ciencia y tecnolog�a de Alimentos');
insert into b_areatrabajo (atsuper,atnombre) values(1,'Ingenier�a Agr�cola');
insert into b_areatrabajo (atsuper,atnombre) values(1,'medicina Veterinaria');
insert into b_areatrabajo (atsuper,atnombre) values(1,'Recursos Forestales e Ingenier�a Forestal');
insert into b_areatrabajo (atsuper,atnombre) values(1,'Recursos pesqueros e Ingenier�a de pesca');
insert into b_areatrabajo (atsuper,atnombre) values(1,'Zootecn�a');

insert into b_areatrabajo (atsuper,atnombre) values(2,'Biof�sica');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Biolog�a General');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Bioqu�mica');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Bot�nica');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Ecolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Farmacolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Fisiolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Gen�tica');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Inmunolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Microbiolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Morfolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Parasitolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(2,'Zoolog�a');

insert into b_areatrabajo (atsuper,atnombre) values(3,'Astronom�a');
insert into b_areatrabajo (atsuper,atnombre) values(3,'Ciencia de la Computaci�n');
insert into b_areatrabajo (atsuper,atnombre) values(3,'F�sica');
insert into b_areatrabajo (atsuper,atnombre) values(3,'Geociencias');
insert into b_areatrabajo (atsuper,atnombre) values(3,'Matem�ticas');
insert into b_areatrabajo (atsuper,atnombre) values(3,'Oceanograf�a');
insert into b_areatrabajo (atsuper,atnombre) values(3,'Probabilidad y Estad�stica');
insert into b_areatrabajo (atsuper,atnombre) values(3,'Qu�mica');

insert into b_areatrabajo (atsuper,atnombre) values(4,'Antropolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(4,'Arqueolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(4,'Ciencia Pol�tica');
insert into b_areatrabajo (atsuper,atnombre) values(4,'Educaci�n');
insert into b_areatrabajo (atsuper,atnombre) values(4,'Filosof�a');
insert into b_areatrabajo (atsuper,atnombre) values(4,'Hist�ria');
insert into b_areatrabajo (atsuper,atnombre) values(4,'Psicolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(4,'Sociolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(4,'Geograf�a');
insert into b_areatrabajo (atsuper,atnombre) values(4,'Teolog�a');


insert into b_areatrabajo (atsuper,atnombre) values(5,'Administraci�n');
insert into b_areatrabajo (atsuper,atnombre) values(5,'Arquitectura y Urbanismo');
insert into b_areatrabajo (atsuper,atnombre) values(5,'Comunicaci�n');
insert into b_areatrabajo (atsuper,atnombre) values(5,'Derecho');
insert into b_areatrabajo (atsuper,atnombre) values(5,'Econom�a');
insert into b_areatrabajo (atsuper,atnombre) values(5,'Planeamiento Urbano y Regional');
insert into b_areatrabajo (atsuper,atnombre) values(5,'Servicio Social');
insert into b_areatrabajo (atsuper,atnombre) values(5,'Demograf�a');
insert into b_areatrabajo (atsuper,atnombre) values(5,'Urbanismo');

insert into b_areatrabajo (atsuper,atnombre) values(6,'Farmacia');
insert into b_areatrabajo (atsuper,atnombre) values(6,'Medicina');
insert into b_areatrabajo (atsuper,atnombre) values(6,'Nutrici�n');
insert into b_areatrabajo (atsuper,atnombre) values(6,'Odontolog�a');
insert into b_areatrabajo (atsuper,atnombre) values(6,'Salud Colectiva');
insert into b_areatrabajo (atsuper,atnombre) values(6,'Enfermer�a');
insert into b_areatrabajo (atsuper,atnombre) values(6,'Educaci�n F�sica');

insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�a Biom�dica');
insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�a Civil');
insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�a Electrica');
insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�a Mec�nica');
insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�a Quimica');
insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�a Sanitaria');
insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�a de Metales y Metal�rgica');
insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�a de Minas');
insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�a de Producci�n');
insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�a Aeroespacial');
insert into b_areatrabajo (atsuper,atnombre) values(7,'Ingenier�as');

insert into b_areatrabajo (atsuper,atnombre) values(8,'Linguistica');
insert into b_areatrabajo (atsuper,atnombre) values(8,'Letras');
insert into b_areatrabajo (atsuper,atnombre) values(8,'Artes');

insert into par_area values(1,22,'Desarrollo de Software, Java, Jsp,Bases de Datos');
insert into par_area values(5,9,'Biolog�a, Otros');
insert into par_area values(7,11,'Taxonom�a');
insert into par_area values(11,57,'Control');



insert into b_estado_propuesta values(9,'Proyecto Aceptado');
insert into b_estado_propuesta values(10,'Proyecto Rechazado');
insert into b_categoria (bcatid,bcatnombre)values(8,'Proyectos');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(8,'Buscar Proyectos',6);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('buscar proyectos','/GestionProyectos/AdminProyectos.x',12,6,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionProyectos/Ajax.x',12,6,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(34,6);
insert into recursos_perfil(spidrec,spidperfil)values(35,6);
insert into usuario_sistema (usidpersona,usnick,usclave,usidperfil)values(9,'fanny',md5('qwerty'),'6,0,0');
insert into item_perfil values(12,6);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/llenar.jsp',12,6,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(36,6);
insert into personal (pernombres,perapellidos) values('Fernando','S�nchez S�nchez');
insert into personal (pernombres,perapellidos) values('Abelardo','Rodriguez Bola�os');
drop index fki_personal;
ALTER TABLE b_pares ADD COLUMN bedoccedula varchar;
ALTER TABLE b_pares ADD COLUMN bedocrut varchar;
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('Cargar Documentos Evaluador','/adminEvaluador/DocumEvaluador.x',7,4,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(37,4);
insert into recursos_perfil(spidrec,spidperfil)values(37,3);

----------------------
ALTER TABLE cidc_grup_semill ALTER cgsfeccreacion TYPE varchar;
ALTER TABLE cidc_grup_semill ALTER COLUMN cgsfeccreacion SET STATISTICS -1;
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('ver Proyecto','/adminProyectos/VerProyecto.jsp',12,6,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(38,6);
insert into recursos_perfil(spidrec,spidperfil)values(38,3);
ALTER TABLE proyectoinvest ADD COLUMN pifechaactinicio date;
ALTER TABLE proyectoinvest ADD COLUMN pifechacontrato date;
ALTER TABLE proyectoinvest ADD COLUMN pifechaactfin date;
CREATE SEQUENCE sec_consecutivo_actaini START 1;
CREATE SEQUENCE sec_consecutivo_contrato START 1;
CREATE SEQUENCE sec_consecutivo_actafin START 1;
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/llenar2.jsp',12,6,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(39,6);
insert into recursos_perfil(spidrec,spidperfil)values(39,3);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionProyectos/documentosServlet.x',12,6,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(40,6);
insert into recursos_perfil(spidrec,spidperfil)values(40,3);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/Contrato.jsp',12,6,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(41,6);
insert into recursos_perfil(spidrec,spidperfil)values(41,3);}

insert into b_categoria (bcatid,bcatnombre)values(9,'Grupos de Investigaci�n');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(9,'Admin. Grupos',5);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminGrupos/AdminGrupos.x',14,5,true,true);
insert into recursos_perfil(spidrec,spidperfil)values(47,5);
insert into recursos_perfil(spidrec,spidperfil)values(47,3);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminGrupos/llenar.jsp',14,5,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(48,5);
insert into recursos_perfil(spidrec,spidperfil)values(48,3);


--------------------------------------------------------------------------------------
ALTER TABLE b_investigadores ADD COLUMN binvpapel int2 DEFAULT 1;
ALTER TABLE b_investigadores ALTER COLUMN binvpapel DROP DEFAULT;
ALTER TABLE b_investigadores ALTER COLUMN binvpapel SET STATISTICS -1;
ALTER TABLE personal ADD COLUMN perdocde varchar;
ALTER TABLE personal DROP COLUMN perdireccion;
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminGrupos/Ajax.x',14,5,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(49,5);
insert into recursos_perfil(spidrec,spidperfil)values(49,3);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminGrupos/adminIntegrantes/llenar.jsp',13,5,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(50,5);
insert into recursos_perfil(spidrec,spidperfil)values(50,3);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table rubrosproyecto (rpidproyecto int references proyectoinvest match simple on delete cascade, rpidrubro int references b_rubros, rpvalor varchar, primary key (rpidproyecto,rpidrubro))
ALTER TABLE inscrip_rubros RENAME inscid  TO inscidprop;
ALTER TABLE inscrip_rubros ALTER COLUMN inscidprop SET STATISTICS -1;
create table gastos_rubro_proyecto (grpidgasto serial primary key, grpidproyecto int references proyectoinvest,grpidrubro int references b_rubros, grpvalor int, grpdescripcion varchar, grpfecha varchar)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(10,'Admin Servicios',1);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/AdminServicios/AdminServicios.x',19,1,true,true);
insert into recursos_perfil(spidrec,spidperfil)values(68,1);
insert into item_perfil(ipiditem,ipidperfil)values(19,1);
insert into item_perfil(ipiditem,ipidperfil)values(13,5);

create table result_parcial (rpidresultado serial primary key, rpidpropuesta int references inscrip_propuesta, rpcorte int, rpradicado int, rpobservaciones varchar)


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/AdminServicios/llenar.jsp',19,1,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/AdminServicios/Ajax.x',19,1,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminGrupos/llenar1.jsp',19,5,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminGrupos/ListaPersonas.jsp',14,5,false,false);
insert into recursos_perfil(spidrec,spidperfil)values(70,1);


ALTER TABLE conv_porcent_eval DROP COLUMN cpeaspectcomite;


---------------------------------------------------------------------------------------

insert into b_categoria (bcatid,bcatnombre)values(11,'GestionGrupo');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(11,'Datos Grupo',10);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/grupos/verGrupo.jsp',20,10,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/gestionGrupos/grupos.x',20,10,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/grupos/llenar.jsp',20,10,false,false);
insert into item_perfil(ipiditem,ipidperfil)values(20,10);

insert into b_categoria (bcatid,bcatnombre)values(12,'Investigacion');

insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(11,'Integrantes',10);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/grupos/GestionGrupo.x?accion=6',21,10,true,true);
insert into item_perfil(ipiditem,ipidperfil)values(21,10);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/grupos/GestionGrupo.x',21,10,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/grupos/llenar1.jsp',21,10,false,false);

insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/HomeInvestigador.jsp',17,8,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/HomeDirector.jsp',17,10,false,false);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(11,'Mis Datos',8);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(12,'Inscripcion Articulos',8);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(12,'Articulos Inscritos',8);
insert into item_perfil(ipiditem,ipidperfil)values(22,8);
insert into item_perfil(ipiditem,ipidperfil)values(23,8);
insert into item_perfil(ipiditem,ipidperfil)values(24,8);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/invest/gestionInvestig.x',22,8,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/invest/articInvestig.x',22,8,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/grupos/investigador/llenar.jsp',22,8,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/invest/articInvestig.x?accion=16',24,8,true,true);

ALTER TABLE articulos ADD COLUMN aidpersona int2;
ALTER TABLE articulos DROP COLUMN adireccionpostal;
ALTER TABLE articulos DROP COLUMN adireccionelect;
ALTER TABLE articulos ADD COLUMN apara int2;


----------------------------------------------------------------------------------------------------------------------------------------------
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(12,'Propuestas Investigacion',8);
insert into item_perfil(ipiditem,ipidperfil)values(25,8);
insert into item_perfil(ipiditem,ipidperfil)values(25,10);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/invest/gestionInvestig.x?accion=17',25,8,true,true);


----------------------------------------------------------------------------------------------------------------------------------------------
insert into b_categoria (bcatid,bcatnombre)values(13,'Documentos');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(13,'Formatos',2);
insert into item_perfil(ipiditem,ipidperfil)values(26,2);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/Documentos.jsp',26,2,true,true);


insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/llenar1.jsp',12,6,false,false);


----------------------------------------------------------------------------------------------------------------------------------------------
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminArticulos/AdminArticulosRevista.x',15,4,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminArticulos/llenarArchivo.jsp',15,4,false,false);
create table artic_revista (arid serial primary key, artitulo varchar, ardocumento varchar, artipo int,artipo_ext_nombre varchar,artipo_ext_apellido varchar, artipo_ext_donde varchar, tipo_int_idpersona int, arfechaingreso varchar, arpublicado int, arestado int)
CREATE TABLE articulorevista_histo_eval(arheidartic int, arheideval int references b_pares, arhefecasigna varchar, arheestado int, arhefeccancela varchar, arhefecrespuesta varchar, PRIMARY KEY (arheidartic, arheideval))

insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(7,'Articulos',3);
insert into item_perfil(ipiditem,ipidperfil)values(27,3);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/EvalArticulos/EvalArticEvento.x',27,3,true,true);

----------------------------------------------------------------------------------------------------------------------------------------------
update recursos set rurl='/adminAsignacion/AsignaEvaluador.x' where rurl='/adminPropuestas/AsignaEvaluador.x';

----------------------------------------------------------------------------------------------------------------------------------------------
create table movilidad (mid serial primary key,midpersona int references personal, mintitucion varchar, mfechaini varchar, mfechafin varchar, mnombreponencia varchar, mnombreautores varchar, mcorte int, mtipo int,mestado int,mnombreevento varchar,mpais varchar,mfechainscripcion varchar,mpagevento varchar, marchaval varchar, marchaceptacion varchar, marchresumen varchar, marchcompleto varchar,marchinfoevent varchar, marchagenda varchar, marchautoriza varchar)
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/movilidad/adminMovilidad.x',3,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/convMovilidad/Insercion.jsp',3,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/convMovilidad/llenar.jsp',3,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/ArchivosMovilidad.x',3,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/convMovilidad/Ajax.x',3,2,false,false);

insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminArticulos/llenar1.jsp',15,4,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminAsignacion/AsignaEvaluador.x',15,4,false,false);

create table artic_histo_eval_revist (ahreidartic int references artic_revista, ahreideval int references personal,ahrefecasigna varchar,ahreestado int, ahrefeccancela varchar, ahrefecrespuesta varchar);

insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/Acta.jsp',12,6,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminGrupos/Ajax.x',22,8,false,false);

----------------------------------------------------------------------------------------------------------------------------------------------
create table movilidad (
mid serial primary key,midpersona int references personal, mcvlac varchar,mtipo int,mpais varchar,ciudad varchar,mnombreevento varchar,
mintitucion varchar,msiglasorg varchar, mfechaini varchar, mfechafin varchar,mpagevento varchar, mnombreponencia varchar,
mnombreautores varchar,mcobertura varchar,mvalinscrip varchar, mmoneda int, mtrayectoria varchar,mcorte int,mestado int,
mfechainscripcion varchar,marchaval varchar, marchaceptacion varchar, marchresumen varchar, marchaproycurr varchar,marchdecanatura varchar,
marchconsfac varchar,mconsaca varchar,marchexcelencia varchar);


create table movilidad_requisitos ( rmidmov int4 references movilidad,rmparevencidc text, rmcompromisos1 text,rmcompromisos2 text, rmcompromisos3 text, rmcompromisos4 text, rmbeneficios1 text, rmbeneficios2 text, rmbeneficios3 text, rmbeneficios4 text, rmbeneficios5 text, rminteresinst1 text,rminteresinst2 text, rminteresinst3 text, rminteresinst4 text)
create table movilidad_partevent(mpeid serial primary key, mpeidmov int references movilidad, mpenombreevento varchar);


insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/movilidad/adminMovilidad.x',3,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/convMovilidad/Insercion.jsp',3,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/convMovilidad/llenar.jsp',3,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/movilidad/ArchivosMovilidad.x',3,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/movilidad/ArchivosMovilidad.x',3,2,false,false);


ALTER TABLE inscrip_propuesta ADD COLUMN inschorasinv int2;
ALTER TABLE inscrip_propuesta ADD COLUMN inscfechainscrip varchar;
ALTER TABLE inscrip_propuesta ADD COLUMN insccorte int2;
ALTER TABLE convocatoria ADD COLUMN convcorte int2 DEFAULT 1;


insert into b_categoria (bcatid,bcatnombre)values(14,'Otros');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(14,'Convertir Archivos PDF',2);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/otros/pdf.jsp',28,2,true,true);

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE inscrip_compromisos(insccompidprop int REFERENCES inscrip_propuesta, insccompidcomp int REFERENCES b_compromisos,insccompcantidad int);



ALTER TABLE inscrip_propuesta ADD COLUMN inscpropanexo varchar;

create table criterio_movilidad(cmid serial primary key ,cmcriterio varchar,cmvalor int);
create table aspecto_movilidad(amid serial primary key, amidcriterio int,amnombre varchar, ampara int, amvalor int);
create table eval_movilidad_aspectos(emaidprop int references movilidad, emaidaspecto int references aspecto_movilidad, emavalor float4, emaevaluador int references personal);
ALTER TABLE eval_movilidad_aspectos ADD PRIMARY KEY (emaidprop, emaidaspecto, emaevaluador);
create table eval_movilidad_criterios(emcidprop int references movilidad, emcidcriterio int references criterio_movilidad, emcobservacion varchar, emaevaluador int references personal);


insert into personal(pernombres,perapellidos)values('evaluador','Juan Carlos Guevara');
insert into usuario_sistema(usidpersona,usnick,usclave,usidperfil) values(3414,'eval',md5('JCG'),'11,0,0');
insert into personal(pernombres,perapellidos)values('evaluador','Jairo Torres');
insert into usuario_sistema(usidpersona,usnick,usclave,usidperfil) values(3415,'eval',md5('JT'),'11,0,0');
insert into personal(pernombres,perapellidos)values('evaluador','Carlos Olmos');
insert into usuario_sistema(usidpersona,usnick,usclave,usidperfil) values(3416,'eval',md5('CO'),'11,0,0');
insert into personal(pernombres,perapellidos)values('evaluador','Julio Cesar Calvo');
insert into usuario_sistema(usidpersona,usnick,usclave,usidperfil) values(3417,'eval',md5('JCC'),'11,0,0');
insert into personal(pernombres,perapellidos)values('evaluador','Pedro Pablo Gomez');
insert into usuario_sistema(usidpersona,usnick,usclave,usidperfil) values(3418,'eval',md5('PPG'),'11,0,0');
insert into personal(pernombres,perapellidos)values('evaluador','Giovanni Bermudez');
insert into usuario_sistema(usidpersona,usnick,usclave,usidperfil) values(3419,'eval',md5('GB'),'11,0,0');
insert into b_categoria (bcatid,bcatnombre)values(15,'Evaluacion');

insert into b_categoria(16,'Resultados')
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(15,'Movilidad',11);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/movilidad/evalMovilidad.x',31,11,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/evalMovilidad/llenar.jsp',31,11,false,false);
insert into item_perfil(ipiditem,ipidperfil)values(31,11);
select * from b_item_categoria

insert into criterio_movilidad (cmcriterio,cmvalor) values('Trayectoria y proyeccion del investigador en la Universidad',50);
insert into criterio_movilidad (cmcriterio,cmvalor) values('Agenda de Cooperacion planteada por el investigador',50);
insert into criterio_movilidad (cmcriterio,cmvalor) values('Caracteristica del evento al que se pretende participar',50);

insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (1,'Registro de productividad durante los dos (2) ultimos anos registrada en CvLAC',1,45);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (1,'Participacion como investigador principal o coinvestigador en proyectos de investigacion financiados por el CIDC',3,35);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (1,'Participacion en grupos o semilleros de investigacion',1,10);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (1,'Participacion en eventos institucionales financiados y organizados por el CIDC',1,45);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (1,'Resultados de excelencia academica en el ultimo ano',3,15);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (1,'Participacion como auxiliar de investigacion en proyectos financiados por el CIDC',2,20);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (2,'Compromisos del Investigador',3,25);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (2,'Beneficio Institucional',3,30);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (2,'Interes Institucional',3,45);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (3,'Organizador del evento',3,30);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (3,'Tipo de cobertura del evento',3,40);
insert into aspecto_movilidad (amidcriterio,amnombre,ampara,amvalor) values (3,'Trayectoria del evento',3,30);



ALTER TABLE proyectoinvest ALTER pifechaactinicio TYPE varchar;
ALTER TABLE proyectoinvest ALTER pifechacontrato TYPE varchar;
ALTER TABLE proyectoinvest ALTER COLUMN pifechaactinicio SET STATISTICS -1;
ALTER TABLE proyectoinvest ALTER COLUMN pifechacontrato SET STATISTICS -1;


-----------------------------------------------------------------------------------------------------------------------------
insert into b_categoria values(16,'Resultados');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(16,'Convocatorias 2009',2);
insert into item_perfil(ipiditem,ipidperfil)values(32,2);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/ResultadosConv/ListaConv.jsp',32,2,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/Resultados/Convocatorias/AdminResConv.x',32,2,false,false);
ALTER TABLE inscrip_compromisos ADD COLUMN insccompcantidad int2;
-----------------------------------------------------------------------------------------------------------------------------

insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(7,'Movilidad',3);
insert into item_perfil(ipiditem,ipidperfil)values(33,3);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/movilidad/EvalMovilidadComite.x',33,3,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/evalMovilidad/llenar.jsp',33,3,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/evalMovilidad/llenar1.jsp',33,3,false,false);




-----------------------------------------------------------------------------------------------------------------------------
insert into b_facultades (bfacnombre)values('Institutos')
select last_value from sec_consecutivo_actaini;
SELECT setval('sec_consecutivo_actaini', 16);

delete from b_perfiles where bperid=11;
update b_perfiles set bpernombre='evaluador3_cidc' where bperid=11;

insert into b_perfiles (bpernombre) values('Control Interno');
insert into b_perfiles (bpernombre) values('IEIE');

insert into personal (pernombres,perapellidos)values('Instituto','IEIE');
insert into personal (pernombres,perapellidos)values('Oficina','Control Interno');
select perid from personal where pernombres='Oficina';
insert into usuario_sistema (usidpersona,usnick,usclave,usidperfil)values(968,'ctrlint',md5('interno'),'12,0,0');


insert into b_ejes_tematicos(ejenombre,ejeano) values('Historia de la Universidad Distrital',2009);
insert into b_ejes_tematicos(ejenombre,ejeano) values('Historia de las dependencias academicas y administrativas de la Universidad Distrital y de las organizaciones afines',2009);
insert into b_ejes_tematicos(ejenombre,ejeano) values('Sujetos historicos (Personajes)',2009);
insert into b_ejes_tematicos(ejenombre,ejeano) values('Uso y aplicaci�n de las Tecnologias de la Informacion y las Comunicaciones en ambientes de aprendizaje',2009);

-----------------------------------------------------------------------------------------------------------------------------
ALTER TABLE b_eval_criterios ADD COLUMN bevalcridependencia varchar;
ALTER TABLE b_eval_criterios ADD COLUMN bevalcriano int2;
ALTER TABLE b_eval_aspectos ADD COLUMN bevalaspano int2;





----------------------------------------------------------------------------------------------------------------------------------
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(16,'Indicadores',2);
insert into item_perfil(ipiditem,ipidperfil)values(34,2);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores.x',34,2,true,true);

select * from b_item_categoria where biccategoria=16;
delete from item_perfil where ipiditem=33 and ipidperfil=2

insert into b_categoria values(17,'Indicadores');




----------------------------------------------------------------------------------------------------------------------------------
create table conv_aspectos_comite (cacidconv int references convocatoria, cacidaspecto int references b_eval_aspectos, caccomite varchar, cacvalor varchar);
create table partiEvent(peidpersona integer, petipoevent integer, peano integer, pefecha varchar primary key (peidpersona,petipoevent))


----------------------------------------------------------------------------------------------------------------------------------
create table b_asp_eval_articulo (baeaid serial primary key, baeatipo int, baeanombre varchar, baeavalor int);

insert into b_asp_eval_articulo (baeatipo,baeanombre,baeavalor)values(1,'Novedad o creatividad en el tratamiento del tema',25);
insert into b_asp_eval_articulo (baeatipo,baeanombre,baeavalor)values(1,'Coherencia entre el problema presentado y el desarrollo de la tematica',25);
insert into b_asp_eval_articulo (baeatipo,baeanombre,baeavalor)values(1,'Redaccion y composicion',20);
insert into b_asp_eval_articulo (baeatipo,baeanombre,baeavalor)values(1,'Pertinencia e impacto del resultado de investigacion y/o creacion',30);

insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/evalArticulos/llenar.jsp',27,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/evalArticulos/llenar1.jsp',27,2,false,false);
/EvalArticulos/EvalArticEvento.x
ALTER TABLE eval_articulo ALTER eavaloraspect TYPE real;



----------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE cidc_grup_semill ADD COLUMN cgsestado integer DEFAULT 1;


insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/docsIndicadores/AdminRAE.x',34,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/Indicadores/docsIndicadores/EditarRAE.jsp',34,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/Indicadores/docsIndicadores/llenar.jsp',34,2,false,false);
CREATE SEQUENCE reporte_rae INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE indrae
(
  iraeid serial NOT NULL,
  iraeiddoc integer NOT NULL,
  iraeapellidos character varying(200),
  iraenombres character varying(200),
  iraetitulo character varying(200),
  iraefechapublicacion character varying(100),
  iraeciudad character varying(50) NOT NULL,
  iraeeditorial character varying(100),
  iraenumeropaginas integer,
  iraedirweb character varying(200),
  iraefechaacceso character varying(20),
  iraesintesisglobal text,
  iraeideacentral text,
  iraepaginaideacentral integer,
  iraeconceptoscategorias text,
  iraeref1 character varying(200),
  iraeref2 character varying(200),
  iraeref3 character varying(200),
  iraeref4 character varying(200),
  iraevaloracioncritica text,
  iraevolumen integer,
  iraenumcapitulo integer,
  CONSTRAINT indrae_pkey PRIMARY KEY (iraeid),
  CONSTRAINT indrae_iraeiddoc_fkey FOREIGN KEY (iraeiddoc)
      REFERENCES inddocs (indiddoc) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)



----------------------------------------------------------------------------------------------------------------------------------

create table b_convenio(bconvid serial primary key,bconvestado integer,bconvnumero integer,bconvnombre varchar, bconventidades varchar, bconvfecha varchar, bconvvalor varchar, bconvano integer, bconvcompromisos varchar,bconvobservaciones varchar);

insert into b_categoria values(18,'Convenios');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(18,'Admin. Convenio',5);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminConvenio/AdminConvenio.x',40,5,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminConvenio/llenar.jsp',40,5,false,false);
insert into item_perfil(ipiditem,ipidperfil)values(40,5);

----------------------------------------------------------------------------------------------------------------------------------
insert into b_categoria values(19,'ProyectosAntiguos');
insert into b_perfiles (bpernombre) values ('Digitador');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(19,'Proyectos Antiguos',16);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(19,'Lista Proyectos',16);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/GestProyectos.x',38,16,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/GestProyectos.x?validar=2',39,16,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/Ajax.x',39,16,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/Llenar.jsp',38,16,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/Llenar1.jsp',39,16,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/Llenar2.jsp',39,16,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/Llenar3.jsp',39,16,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/Llenar4.jsp',39,16,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/Llenar5.jsp',39,16,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/ArchivoServlet.x',39,16,false,false);
insert into b_convenios (bconvid,bconvnombre) values (0,'Sin nombre de convenio');
insert into item_perfil(ipiditem,ipidperfil)values(38,16);
insert into item_perfil(ipiditem,ipidperfil)values(39,16);

inser into b_convenios (bconvnombre) values ('Sin convenio');
----------------------------------------------------------------------------------------------------------------------------------
insert into b_categoria values(20,'Encuesta');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(20,'Digitalizar Encuesta',14);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/encuestas/AdminEncuesta.x',36,16,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/Encuesta/llenar.jsp',37,16,true,true);


insert into item_perfil(ipiditem,ipidperfil)values(38,14);




create database siciud2 owner admin_cidc


----------------------------------------------------------------------------------------------------------------------------------

insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(20,'Ver Estadistica',14);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/GestProyectos.x',37,16,true,true);

insert into item_perfil(ipiditem,ipidperfil)values(39,14);



----------------------------------------------------------------------------------------------------------------------------------

insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(17,'Crear Ficha',15);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(17,'Consultar Fichas',15);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(17,'Ingresar Informacion',15);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(17,'Banco de Variables',15);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(17,'Reportes',15);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores/AdminIndicadores.x?accion=1',42,15,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores/AdminIndicadores.x?accion=2',43,15,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores/AdminIndicadores.x?accion=7',44,15,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores/AdminIndicadores.x?accion=3',45,15,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores/AdminIndicadores.x?accion=9',46,15,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores/AdminIndicadores.x',42,15,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores/AdminIndicadores.x',43,15,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores/AdminIndicadores.x',44,15,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores/AdminIndicadores.x',45,15,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/indicadores/AdminIndicadores.x',46,15,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionIndicadores/llenar.jsp',42,15,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionIndicadores/llenarFicha.jsp',42,15,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionIndicadores/llenarVariables.jsp',42,15,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionIndicadores/llenarFormula.jsp',42,15,false,false);
insert into item_perfil(ipiditem,ipidperfil)values(42,15);
insert into item_perfil(ipiditem,ipidperfil)values(43,15);
insert into item_perfil(ipiditem,ipidperfil)values(44,15);
insert into item_perfil(ipiditem,ipidperfil)values(45,15);
insert into item_perfil(ipiditem,ipidperfil)values(46,15);

insert into item_perfil(ipiditem,ipidperfil)values(42,17);
insert into item_perfil(ipiditem,ipidperfil)values(43,17);
insert into item_perfil(ipiditem,ipidperfil)values(44,17);
insert into item_perfil(ipiditem,ipidperfil)values(45,17);
insert into item_perfil(ipiditem,ipidperfil)values(46,17);

insert into item_perfil(ipiditem,ipidperfil)values(42,20);
insert into item_perfil(ipiditem,ipidperfil)values(43,20);
insert into item_perfil(ipiditem,ipidperfil)values(44,20);
insert into item_perfil(ipiditem,ipidperfil)values(45,20);
insert into item_perfil(ipiditem,ipidperfil)values(46,20);
insert into personal (pernombres,perapellidos)values('Planeacion','');



-----------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE pa_proy_data_gral ADD COLUMN ppdgflag numeric DEFAULT 0;
create table pa_observaciones (paoid serial primary key,paoidproyecto integer references pa_proy_data_gral, paofecha character varying, paoobservacion character varying, paousuario integer DEFAULT 0);

create table observaciones_proyecto(opid serial primary key, opobservacion varchar, opfecha date, optipo numeric)



-----------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE proyectoinvest ADD COLUMN pistrevision integer DEFAULT 0;
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/Documentos.jsp',12,6,false,false);
create table proyectoinformes(piidinforme serial primary key, piidproyecto integer references proyectoinvest,pifechaentrega varchar, piestado integer, pitipo integer,piobservaciones varchar);
CREATE TABLE proyectobservaciones (pooid serial primary key,poofecha character varying,pooobservacion character varying, pooidproyecto integer references proyectoinvest, poousuario integer DEFAULT 0);
ALTER TABLE proyectoinvest ALTER COLUMN piestado SET DEFAULT 0;

ALTER TABLE cidc_grup_semill ADD COLUMN cgshabilmovilidad boolean NOT NULL DEFAULT true;
create table movilidad_informes(miidponencia integer primary key references movilidad, miidpersona integer references personal, miestado int)
ALTER TABLE convocatoria ADD COLUMN convcorteact character varying;
create table notificaciones (nidnotificacion serial primary key,nidpersona integer default 0, nperfil integer,ndescripcion varchar, nfecha date, natendido date,nestado int,nnivel integer)
create table convocatoria_cortes (ccidcorte serial primary key,ccidconvocatoria integer references convocatoria, ccnumcorte integer, ccfecapertura date, ccfeccierre date, ccauxapertura date, ccauxcierre date);


insert into personal (pernombres,perapellidos)values('Funcionario Colciencias','Planeación');
insert into usuario_sistema (usidpersona,usnick,usclave,usidperfil,usfecha)values((select last_value from personal_perid_seq),'planeacion_colciencias',md5('planeacion123'),'39,0,0',current_date);

insert into personal (pernombres,perapellidos)values('Funcionario Scienti','Colciencias');
insert into usuario_sistema (usidpersona,usnick,usclave,usidperfil,usfecha)values((select last_value from personal_perid_seq),'scienti',md5('scienti123'),'40,0,0',current_date);

insert into personal (pernombres,perapellidos)values('Funcionario CvLAC','Colciencias');
insert into usuario_sistema (usidpersona,usnick,usclave,usidperfil,usfecha)values((select last_value from personal_perid_seq),'cvlac',md5('cvlac123'),'41,0,0',current_date);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionIndicadores/ReporteColumnasH.jsp',42,15,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionIndicadores/ReporteTortas.jsp',42,15,false,false);


-----------------------------------------------------------------------------------------------------------------------------------------
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/CargarInforme.x',12,6,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionProyectos/CargarExcelGastos.x',12,6,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/llenarGasto.jsp',12,6,false,false);
ALTER TABLE gastos_rubro_proyecto ADD COLUMN grpcodigo character varying;
ALTER TABLE gastos_rubro_proyecto ADD COLUMN grppara integer DEFAULT 1;
ALTER TABLE gastos_rubro_proyecto ADD COLUMN grpobservacion character varying;

insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionProyectos/CargarExcelGastos.x',32,6,false,false);




-----------------------------------------------------------------------------------------------------------------------------------------

insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/ResultadosConv/ListaConv2010.jsp',47,2,true,true);
select * from recursos where rurl='/ResultadosConv/ListaConv2010.jsp';

insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(16,'Convocatorias 2010',2);
select * from  b_item_categoria where biccategoria=16;
insert into item_perfil(ipiditem,ipidperfil)values(48,17);

-----------------------------------------------------------------------------------------------------------------------------------------
insert into notificaciones (nidpersona,nperfil,ndescripcion,nfecha,nestado,nnivel,nfechaatencion)values(1,null,'inserci�n de info aleatorea',current_date,1,1,null);
insert into notificaciones (nidpersona,nperfil,ndescripcion,nfecha,nestado,nnivel,nfechaatencion)values(null,10,'Propuesta aprobada',current_date,1,1,null);
insert into notificaciones (nidpersona,nperfil,ndescripcion,nfecha,nestado,nnivel,nfechaatencion)values(10,null,'Texto XX',current_date,1,1,null);
insert into notificaciones (nidpersona,nperfil,ndescripcion,nfecha,nestado,nnivel,nfechaatencion)values(null,10,'Hola torola',current_date,1,3,null);

-----------------------------------------------------------------------------------------------------------------------------------------
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/GestionProyectos/CrearResumenExcel.x',12,6,false,false);

create table notificacion_estado (neidnotificacion integer references notificaciones,neidpersona integer references personal,neestado integer DEFAULT 1,nefechatencion date);

insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/BancoVariables/AyudaTooltip.jsp',47,15,false,false);


ALTER TABLE b_perfiles ADD COLUMN bpactivo boolean default true;
ALTER TABLE b_perfiles ADD COLUMN bpdescripcion character varying;




insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/Notificaciones/llenar.jsp',47,4,false,false);



insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(12,'Proyectos Investigacion',10);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/ProyectosInvestigador.x',49,10,true,true);
insert into item_perfil(ipiditem,ipidperfil)values(49,10);
insert into item_perfil(ipiditem,ipidperfil)values(49,8);
CREATE TABLE proyectocambios (pcidcambio serial NOT NULL, pcidproy integer references proyectoinvest, pcsolicitud character varying, pcrespuesta character varying, pcaprobacion character varying, pctipo integer, pcobservaciones character varying)
create table pa_rubros_aprobados (paraidproyecto integer references pa_proy_data_gral, paraidrubro integer references b_rubros,paravalor numeric);




insert into b_categoria values(24,'Notificaciones');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(24,'Asignar Notificacion',1);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/notificaciones/adminNotificacio.x?accion=1',50,1,true,true);
insert into item_perfil(ipiditem,ipidperfil)values(50,1);
insert into item_perfil(ipiditem,ipidperfil)values(50,3);
insert into item_perfil(ipiditem,ipidperfil)values(50,4);
insert into item_perfil(ipiditem,ipidperfil)values(50,5);
insert into item_perfil(ipiditem,ipidperfil)values(50,6);
insert into item_perfil(ipiditem,ipidperfil)values(50,7);



insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminGrupos/adminIntegrantes/llenarIntegrante.jsp',13,5,false,false);

insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/proyectosAntiguos/Llenar6.jsp',39,16,false,false);



-----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO b_perfiles (bpernombre,bpactivo,bpdescripcion) VALUES ( 'Unidad Investigaciones Facultad Tecnologica', true, 'Unidad Investigaciones Facultad Tecnologica');
INSERT INTO b_perfiles (bpernombre,bpactivo,bpdescripcion) VALUES ( 'Unidad Investigaciones Facultad Ingenier�a', true, 'Unidad Investigaciones Facultad Ingenier�a');
INSERT INTO b_perfiles (bpernombre,bpactivo,bpdescripcion) VALUES ( 'Unidad Investigaciones Facultad Medio Ambiente', true, 'Unidad Investigaciones Facultad Medio Ambiente');
INSERT INTO b_perfiles (bpernombre,bpactivo,bpdescripcion) VALUES ( 'Unidad Investigaciones Facultad Educacion', true, 'Unidad Investigaciones Facultad Educacion');
INSERT INTO b_perfiles (bpernombre,bpactivo,bpdescripcion) VALUES ( 'Unidad Investigaciones Facultad Artes', true, 'Unidad Investigaciones Facultad Artes');
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(8,'Proyectos Facultad',43);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(9,'Grupos Facultad',43);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/unidadInvest/AdminUnidadFacultad.x?accion=1',51,43,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/unidadInvest/llenarFiltro.jsp',51,43,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/unidadInvest/AdminUnidadFacultad.x',51,43,false,false);
insert into item_perfil(ipiditem,ipidperfil)values(51,43);
insert into item_perfil(ipiditem,ipidperfil)values(52,43);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/unidadInvest/ListaGrupos.jsp',52,43,true,true);

insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminGrupos/NuevoGrupo.jsp',13,5,false,false);
ALTER TABLE personal ADD CONSTRAINT documento UNIQUE (pernumdoc);



insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(13,'Conf. Estructura Invest.',2);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(13,'Actividades Invest.',2);
insert into recursos (rurl,riditem,ridperfil,rprimario,rvisible)values ('/Documentos/TramitesCIDC.jsp',26,2,false,false);
insert into recursos (rurl,riditem,ridperfil,rprimario,rvisible)values ('/Documentos/Estructuras.jsp',54,2,True,True);
insert into recursos (rurl,riditem,ridperfil,rprimario,rvisible)values ('/Documentos/Actividades.jsp',55,2,True,True);
insert into item_perfil(ipiditem,ipidperfil)values(54,2);
insert into item_perfil(ipiditem,ipidperfil)values(55,2);

------------------------------------------------------------------------------------------------------------------------------------
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/grupos/GestionGrupo.x',20,10,false,false);
update recursos set rurl='/grupos/llenarIntegrante.jsp' where rurl='/grupos/llenar1.jsp';
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminGrupos/AdminGrupos.x',20,10,false,false);
ALTER TABLE proyectoinvest DROP COLUMN pifechaactfin;
ALTER TABLE proyectoinvest ADD COLUMN pifechaactfin character varying;
ALTER TABLE proyectodocumentos ADD COLUMN pdfechacarga date;



insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(13,'Normatividad',2);

select last_value from b_item_categoria_bicid_seq
SELECT setval('b_item_categoria_bicid_seq', 55);

insert into recursos (rurl,riditem,ridperfil,rprimario,rvisible)values ('/Documentos/Normatividad.jsp',55,2,True,True);
insert into item_perfil(ipiditem,ipidperfil)values(55,2);



ALTER TABLE personal ADD COLUMN percelular2 character varying;
ALTER TABLE personal ADD COLUMN pertelefono2 character varying;
ALTER TABLE personal ADD COLUMN perfechanacimiento character varying;
ALTER TABLE personal ADD COLUMN perfechaingud character varying;
ALTER TABLE personal ADD COLUMN perfechasalidaud character varying;

ALTER TABLE personal ADD COLUMN peractualizado boolean;
ALTER TABLE personal ADD COLUMN pergenero integer;

insert into proyectoinvest (picodigo,piidprop,pifechaaprob,piestado,pitipo,piano)values(null,676,'2011-12-15',2,1,2010)


insert into inscrip_rubros (inscidprop,inscidrub,inscrubvalcidc,inscrubvalud,inscrubvalcontra)values(676,7,10000








select picodigo,pifechaaprob,pifechaactinicio,convduracion,lower(pernombres),lower(perapellidos),lower(inscpropnombre),(select sum(inscrubvalcidc) from inscrip_rubros where inscidprop=inscid),(select (select sum(grpvalor)from gastos_rubro_proyecto where grpidproyecto=piid and grptipo=1)-(select sum(grpvalor)from gastos_rubro_proyecto where grpidproyecto=piid and grptipo=-1)) from proyectoinvest,inscrip_propuesta,convocatoria,personal where piidprop=inscid and piestado=2 and inscinvprin=perid and inscconvid=convid order by picodigo
select picodigo,sum(grpvalor) from gastos_rubro_proyecto,proyectoinvest where grpidproyecto=piid and grppara=1 and grptipo=1 and picodigo='3-10-30-08' group by picodigo order by picodigo
select picodigo,grpvalor,grptipo,grppara from gastos_rubro_proyecto,proyectoinvest where grpidproyecto=piid and picodigo='3-10-42-08' and grptipo=1 order by picodigo
select (select sum(grpvalor)from gastos_rubro_proyecto,proyectoinvest where grpidproyecto=piid and picodigo='3-10-30-08' and grptipo=1),(select case sum(grpvalor) when null then 0 end from gastos_rubro_proyecto,proyectoinvest where grpidproyecto=piid and picodigo='3-10-30-08' and grptipo<0)




ALTER TABLE gastos_rubro_proyecto ADD COLUMN grpubicacion "char";
ALTER TABLE gastos_rubro_proyecto ADD COLUMN grpidgrupo integer;
ALTER TABLE gastos_rubro_proyecto ADD COLUMN grpobserventrega character varying;
ALTER TABLE gastos_rubro_proyecto ADD COLUMN grepfechaentrega date;

COMMENT ON COLUMN gastos_rubro_proyecto.grpubicacion IS 'Ubicación del elemento al momento de la devolución
Valores posibles: P= Proyecto, G=Grupo, B=Biblioteca, Null= no se ha entregado';
COMMENT ON COLUMN gastos_rubro_proyecto.grpidgrupo IS 'Identificación del grupo que tiene a cargo ese elemento de inventario';
COMMENT ON COLUMN gastos_rubro_proyecto.grpobserventrega IS 'Observaciones de la devolución del elemento';
COMMENT ON COLUMN gastos_rubro_proyecto.grepfechaentrega IS 'Fecha de la entrega o devolución del elemento de inventario';

insert into recursos (rurl,riditem,ridperfil,rprimario,rvisible)values ('/adminProyectos/llenarEntrega.jsp',12,6,True,True);


create table inventario_grupo (igid serial primary key,igidgrupo integer references cidc_grup_semill,igelemento character varying,igfecha date,igtipo integer, igcodigo character varying, igvalor numeric)



insert into recursos (rurl,riditem,ridperfil,rprimario,rvisible)values ('/eventos/GestionEvento.x',57,10,false,false);
insert into b_item_categoria (biccategoria,bicnombre,bicperfil)values(25,'Inscripción Evento',10);
insert into b_categoria (bcatid,bcatnombre)values(25,'Eventos');


insert into recursos (rurl,riditem,ridperfil,rprimario,rvisible)values ('/ResultadosConv/ListaConv2011.jsp',57,2,true,true);



insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('inventario grupos','/gruposInventario/NuevoElementoGrupo.jsp',58,7,true,true);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('inventario grupos','/gruposInventario/llenar.jsp',58,7,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('inventario grupos','/gruposInventario/FiltroElemento.jsp',58,7,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('inventario grupos','/inventario/InventarioGrupos.x',58,7,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('inventario grupos','/inventario/Ajax.x',58,7,false,false);


-*-------
select picodigo,grpdescripcion,grpcodigo,grpvalor,when  from gastos_rubro_proyecto,proyectoinvest where grpidproyecto=piid and grpdescripcion like '' or grpcodigo like '' or grpdescripcion like ''

insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('inventario grupos','/GestionGeneralProyectos/AdminGeneralProyectos.x',12,4,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('inventario grupos','/PagWeb/llenarFiltroPaginaWebProyectos.jsp',17,2,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('inventario grupos','/web/Consultas.x',17,2,false,false);

ALTER TABLE pa_gastos ADD COLUMN pgpara integer;
update pa_gastos set pgpara=pgtipogasto;
update pa_gastos set pgtipogasto=1 where pgidrubro<>1000;
update pa_gastos set pgtipogasto=-1 where pgidrubro=1000;



create table proyectotiempos (ptidtiempo serial primary key, ptidproyecto integer references proyectoinvest,pttipotiempo integer,ptfechaasignacion date, ptvalortiempo integer, ptdescripcion character varying,ptidusuario integer references personal);
create table pa_tiempos (paidtiempo serial primary key, paidproyecto integer references pa_proy_data_gral,patipotiempo integer,pafechaasignacion date, pavalortiempo integer, padescripcion character varying,paidusuario integer references personal);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/VerTiempos.jsp',12,4,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/llenarTiempo.jsp',12,4,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/Coinvestigadores.jsp',12,4,false,false);
insert into recursos (rnombre,rurl,riditem,ridperfil,rprimario,rvisible)values('','/adminProyectos/llenarInvestigador.jsp',12,4,false,false);