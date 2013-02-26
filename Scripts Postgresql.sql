CREATE TABLE b_categoria
(
  bcatid int4 NOT NULL DEFAULT nextval('b_categoria_bcatid_seq'::regclass),
  bcatnombre varchar,
  CONSTRAINT b_categoria_pkey PRIMARY KEY (bcatid)
)
WITHOUT OIDS;
ALTER TABLE b_categoria OWNER TO admincidc;

CREATE TABLE b_compromisos
(
  bcompid int4 NOT NULL DEFAULT nextval('b_compromisos_bcompid_seq'::regclass),
  bcompproducto varchar,
  bcompindicador varchar,
  CONSTRAINT b_compromisos_pkey PRIMARY KEY (bcompid)
)
WITHOUT OIDS;
ALTER TABLE b_compromisos OWNER TO admincidc;

CREATE TABLE b_ejes_tematicos
(
  bejeid int4 NOT NULL DEFAULT nextval('b_ejes_tematicos_bejeid_seq'::regclass),
  ejenombre varchar,
  ejeobjetivo varchar,
  CONSTRAINT b_ejes_tematicos_pkey PRIMARY KEY (bejeid)
)
WITHOUT OIDS;
ALTER TABLE b_ejes_tematicos OWNER TO admincidc;

CREATE TABLE b_eval_aspectos
(
  bevalaspid int4 NOT NULL DEFAULT nextval('b_eval_aspectos_bevalaspid_seq'::regclass),
  bevalidcrit int4,
  bevalaspnombre varchar,
  bevalaspdescripcion varchar,
  CONSTRAINT b_eval_aspectos_pkey PRIMARY KEY (bevalaspid),
  CONSTRAINT b_eval_aspectos_bevalidcrit_fkey FOREIGN KEY (bevalidcrit)
      REFERENCES b_eval_criterios (bevalcriid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE b_eval_aspectos OWNER TO admincidc;

CREATE TABLE b_eval_criterios
(
  bevalcriid int4 NOT NULL DEFAULT nextval('b_eval_criterios_bevalcriid_seq'::regclass),
  bevalcrinombre varchar,
  CONSTRAINT b_eval_criterios_pkey PRIMARY KEY (bevalcriid)
)
WITHOUT OIDS;
ALTER TABLE b_eval_criterios OWNER TO admincidc;

CREATE TABLE b_facultades
(
  bfacid int4 NOT NULL DEFAULT nextval('b_facultades_bfacid_seq'::regclass),
  bfacnombre varchar,
  CONSTRAINT b_facultades_pkey PRIMARY KEY (bfacid)
)
WITHOUT OIDS;
ALTER TABLE b_facultades OWNER TO admincidc;

CREATE TABLE b_investigadores
(
  binvidper int4 NOT NULL,
  binvidfac int4,
  binvidgrupoinv int4,
  CONSTRAINT b_investigadores_pkey PRIMARY KEY (binvidper),
  CONSTRAINT b_investigadores_binvidfac_fkey FOREIGN KEY (binvidfac)
      REFERENCES b_facultades (bfacid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT b_investigadores_binvidgrupoinv_fkey FOREIGN KEY (binvidgrupoinv)
      REFERENCES cidc_grup_semill (cgsid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE b_investigadores OWNER TO admincidc;

CREATE TABLE b_item_categoria
(
  bicid int4 NOT NULL DEFAULT nextval('b_item_categoria_bicid_seq'::regclass),
  biccategoria int4,
  bicnombre varchar,
  bicperfil int4,
  CONSTRAINT b_item_categoria_pkey PRIMARY KEY (bicid),
  CONSTRAINT b_item_categoria_biccategoria_fkey FOREIGN KEY (biccategoria)
      REFERENCES b_categoria (bcatid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT b_item_categoria_bicperfil_fkey FOREIGN KEY (bicperfil)
      REFERENCES b_perfiles (bperid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE b_item_categoria OWNER TO admincidc;

CREATE TABLE b_lineas_investigacion
(
  blinid int4 NOT NULL DEFAULT nextval('b_lineas_investigacion_blinid_seq'::regclass),
  blinnombre varchar,
  blindescripcion varchar,
  CONSTRAINT b_lineas_investigacion_pkey PRIMARY KEY (blinid)
)
WITHOUT OIDS;
ALTER TABLE b_lineas_investigacion OWNER TO admincidc;

CREATE TABLE b_perfiles
(
  bperid int4 NOT NULL DEFAULT nextval('b_perfiles_bperid_seq'::regclass),
  bpernombre varchar,
  bpernivel varchar,
  CONSTRAINT b_perfiles_pkey PRIMARY KEY (bperid)
)
WITHOUT OIDS;
ALTER TABLE b_perfiles OWNER TO admincidc;

CREATE TABLE b_proyecto_curricular
(
  bpccodigo int4 NOT NULL,
  bpccodfacultad int4,
  bpcnombre varchar,
  bpcestado bool,
  CONSTRAINT b_proyecto_curricular_pkey PRIMARY KEY (bpccodigo),
  CONSTRAINT b_proyecto_curricular_bpccodfacultad_fkey FOREIGN KEY (bpccodfacultad)
      REFERENCES b_facultades (bfacid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE b_proyecto_curricular OWNER TO admincidc;

CREATE TABLE b_rubros
(
  brubid int4 NOT NULL DEFAULT nextval('b_rubros_brubid_seq'::regclass),
  brubnombre varchar,
  CONSTRAINT b_rubros_pkey PRIMARY KEY (brubid)
)
WITHOUT OIDS;
ALTER TABLE b_rubros OWNER TO admincidc;

CREATE TABLE b_valor_aspecto
(
  bvalaspnombre varchar NOT NULL,
  bvalaspsigla varchar,
  bvalaspvalor int4,
  CONSTRAINT b_valor_aspecto_pkey PRIMARY KEY (bvalaspnombre)
)
WITHOUT OIDS;
ALTER TABLE b_valor_aspecto OWNER TO admincidc;

CREATE TABLE cidc_grup_semill
(
  cgsid int4 NOT NULL DEFAULT nextval('cidc_grup_semill_cgsid_seq'::regclass),
  cgscodigo int4,
  cgsnombre varchar,
  cgssiglas varchar,
  cgscategoria varchar,
  cgsiddirector int4,
  cgsweb varchar,
  cgsmail varchar,
  cgsfeccreacion date,
  cgsfacultad int4,
  cgsmision text,
  cgsvision text,
  cgstipo int4,
  CONSTRAINT cidc_grup_semill_pkey PRIMARY KEY (cgsid)
)
WITHOUT OIDS;
ALTER TABLE cidc_grup_semill OWNER TO admincidc;

CREATE TABLE conv_aspectos
(
  idconv int4,
  idcrit int4,
  idaspec int4,
  baspvalor int4,
  CONSTRAINT conv_aspectos_idaspec_fkey FOREIGN KEY (idaspec)
      REFERENCES b_eval_aspectos (bevalaspid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT conv_aspectos_idconv_fkey FOREIGN KEY (idconv)
      REFERENCES convocatoria (convid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT conv_aspectos_idcrit_fkey FOREIGN KEY (idcrit)
      REFERENCES b_eval_criterios (bevalcriid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE conv_aspectos OWNER TO admincidc;

CREATE TABLE conv_compromisos
(
  idconv int4,
  idcomp int4,
  ccobligatorio int4,
  CONSTRAINT conv_compromisos_idcomp_fkey FOREIGN KEY (idcomp)
      REFERENCES b_compromisos (bcompid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT conv_compromisos_idconv_fkey FOREIGN KEY (idconv)
      REFERENCES convocatoria (convid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE conv_compromisos OWNER TO admincidc;

CREATE TABLE conv_criterios
(
  idconv int4,
  idcrit int4,
  bcrivalor int4,
  CONSTRAINT conv_criterios_idconv_fkey FOREIGN KEY (idconv)
      REFERENCES convocatoria (convid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT conv_criterios_idcrit_fkey FOREIGN KEY (idcrit)
      REFERENCES b_eval_criterios (bevalcriid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE conv_criterios OWNER TO admincidc;

CREATE TABLE conv_ejes
(
  idconv int4,
  ideje int4,
  CONSTRAINT conv_ejes_idconv_fkey FOREIGN KEY (idconv)
      REFERENCES convocatoria (convid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT conv_ejes_ideje_fkey FOREIGN KEY (ideje)
      REFERENCES b_ejes_tematicos (bejeid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE conv_ejes OWNER TO admincidc;


CREATE TABLE conv_rubros
(
  idconv int4,
  convidrub int4,
  convrubvalor int4,
  CONSTRAINT conv_rubros_idconv_fkey FOREIGN KEY (idconv)
      REFERENCES convocatoria (convid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT conv_rubros_idrub_fkey FOREIGN KEY (convidrub)
      REFERENCES b_rubros (brubid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE conv_rubros OWNER TO admincidc;

CREATE TABLE convocatoria
(
  convid int4 NOT NULL DEFAULT nextval('convocatoria_convid_seq'::regclass),
  convano int4,
  convnumero int4,
  convnombre varchar,
  convcuantia varchar,
  convduracion int4,
  convfecinicio varchar,
  convfecfin varchar,
  convdirigido varchar,
  convpublica bool,
  convarchivo varchar,
  convobserrubro varchar,
  convcerrada bool,
  CONSTRAINT convocatoria_pkey PRIMARY KEY (convid),
  CONSTRAINT convocatoria_convano_key UNIQUE (convano, convnumero)
)
WITHOUT OIDS;
ALTER TABLE convocatoria OWNER TO admincidc;

CREATE TABLE grupo_servicios
(
  grservid int4 NOT NULL DEFAULT nextval('grupo_servicios_grservid_seq'::regclass),
  grservnombre varchar,
  CONSTRAINT grupo_servicios_pkey PRIMARY KEY (grservid)
)
WITHOUT OIDS;
ALTER TABLE grupo_servicios OWNER TO admincidc;

CREATE TABLE inscrip_clave_ingreso
(
  inscid int4 NOT NULL,
  insclaingclave varchar NOT NULL,
  CONSTRAINT inscrip_clave_ingreso_pkey PRIMARY KEY (inscid, insclaingclave),
  CONSTRAINT inscrip_clave_ingreso_inscid_fkey FOREIGN KEY (inscid)
      REFERENCES inscrip_propuesta (inscid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE inscrip_clave_ingreso OWNER TO admincidc;

CREATE TABLE inscrip_coinvestigador
(
  inscid int4,
  incoinvdocumento varchar,
  incoinvnombres varchar,
  incoinvapellidos varchar,
  incoinvinstitucion varchar,
  CONSTRAINT inscrip_coinvestigador_inscid_fkey FOREIGN KEY (inscid)
      REFERENCES inscrip_propuesta (inscid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE inscrip_coinvestigador OWNER TO admincidc;

CREATE TABLE inscrip_propuesta
(
  inscid int4 NOT NULL DEFAULT nextval('inscrip_propuesta_inscid_seq'::regclass),
  inscconvid int4,
  inscfacultad int4,
  inscproycur int4,
  inscgrupo int4,
  inscinvprin int4,
  inscpropnombre varchar,
  inscproparchivo varchar,
  inscpalclave varchar,
  inscabstract varchar,
  CONSTRAINT inscrip_propuesta_pkey PRIMARY KEY (inscid),
  CONSTRAINT inscrip_propuesta_convid_fkey FOREIGN KEY (inscconvid)
      REFERENCES convocatoria (convid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT inscrip_propuesta_inscfacultad_fkey FOREIGN KEY (inscfacultad)
      REFERENCES b_facultades (bfacid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT inscrip_propuesta_inscgrupo_fkey FOREIGN KEY (inscgrupo)
      REFERENCES cidc_grup_semill (cgsid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT inscrip_propuesta_inscinvprin_fkey FOREIGN KEY (inscinvprin)
      REFERENCES personal (perid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT inscrip_propuesta_inscproycur_fkey FOREIGN KEY (inscproycur)
      REFERENCES b_proyecto_curricular (bpccodigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE inscrip_propuesta OWNER TO admincidc;

CREATE TABLE inscrip_rubros
(
  inscid int4,
  inscidrub int4,
  inscrubvalud int4,
  inscrubvalcidc int4,
  inscrubvalcontra int4,
  CONSTRAINT inscrip_rubros_idrub_fkey FOREIGN KEY (inscidrub)
      REFERENCES b_rubros (brubid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT inscrip_rubros_inscid_fkey FOREIGN KEY (inscid)
      REFERENCES inscrip_propuesta (inscid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE inscrip_rubros OWNER TO admincidc;

CREATE TABLE persona_perfil
(
  bperfid int4,
  bperidpersona int4,
  CONSTRAINT persona_perfil_bperidpersona_fkey FOREIGN KEY (bperidpersona)
      REFERENCES personal (perid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE persona_perfil OWNER TO admincidc;


CREATE TABLE personal
(
  perid int4 NOT NULL DEFAULT nextval('personal_perid_seq'::regclass),
  pernumdoc int4,
  pertipodoc varchar,
  pernombres varchar,
  perapellidos varchar,
  permail varchar,
  perdireccion varchar,
  pertelefono varchar,
  percelular varchar,
  CONSTRAINT personal_pkey PRIMARY KEY (perid)
)
WITHOUT OIDS;
ALTER TABLE personal OWNER TO admincidc;

CREATE TABLE personal_formacion
(
  performid int4 NOT NULL DEFAULT nextval('personal_formacion_performid_seq'::regclass),
  performidpersona int4,
  perfomprograma varchar,
  performinstitucion varchar,
  performtitulo varchar,
  performano int4,
  CONSTRAINT personal_formacion_pkey PRIMARY KEY (performid)
)
WITHOUT OIDS;
ALTER TABLE personal_formacion OWNER TO admincidc;

CREATE TABLE recursos
(
  ridrecurso int4 NOT NULL DEFAULT nextval('recursos_ridrecurso_seq'::regclass),
  rnombre varchar,
  rurl varchar,
  riditem int4,
  CONSTRAINT recursos_pkey PRIMARY KEY (ridrecurso),
  CONSTRAINT recursos_riditem_fkey FOREIGN KEY (riditem)
      REFERENCES b_item_categoria (bicid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE recursos OWNER TO admincidc;

CREATE TABLE usuario_sistema
(
  usid varchar,
  usidpersona int4,
  usnick varchar,
  usclave varchar,
  usidperfil int4,
  CONSTRAINT usuario_sistema_usidpersona_fkey FOREIGN KEY (usidpersona)
      REFERENCES personal (perid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITHOUT OIDS;
ALTER TABLE usuario_sistema OWNER TO admincidc;
