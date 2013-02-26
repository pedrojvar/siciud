Consultar saldos de proyectos de investigación vigentes

select picodigo,pifechaaprob,pifechaactinicio,lower(pernombres),lower(perapellidos),lower(inscpropnombre),
(select sum(inscrubvalcidc) from inscrip_rubros where inscidprop=inscid),
(select sum(grpvalor)from gastos_rubro_proyecto  where grpidproyecto=piid and grptipo=1),
(select sum(grpvalor)from gastos_rubro_proyecto where grpidproyecto=piid and grptipo=-1)
from proyectoinvest,inscrip_propuesta,personal where piidprop=inscid and piestado=2 and inscinvprin=perid order by picodigo

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------