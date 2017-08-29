
select 
    t.object_id [ObjectId],
	t.name [TableName], 
	s.name [SchemaName],
	c.name [ColumnName],
	ty.name [ColumnType],
	c.max_length [MaxLength],
	c.precision [Precision],
	c.scale [Scale],
	c.is_nullable [IsNullable],
	c.is_identity [IsIdentity]
from sys.tables t
inner join sys.schemas s on t.schema_id = s.schema_id
inner join sys.columns c on t.object_id = c.object_id
inner join sys.types ty on c.user_type_id = ty.user_type_id
where t.name='Postulante'
order by t.name
FOR XML PATH ('TABLE'), root ('Root')
--FOR XML AUTO, ELEMENTS

select 
    t.object_id [Table/ObjectId],
	t.name [Table/Name], 
	s.name [Table/Schema],
	c.name [Table/Column/Name],
	ty.name [Table/Column/Type],
	c.max_length [Table/Column/MaxLength],
	c.precision [Table/Column/Precision],
	c.scale [Table/Column/Scale],
	c.is_nullable [Table/Column/IsNullable],
	c.is_identity [Table/Column/IsIdentity]
from sys.tables t
inner join sys.schemas s on t.schema_id = s.schema_id
inner join sys.columns c on t.object_id = c.object_id
inner join sys.types ty on c.user_type_id = ty.user_type_id
where t.name='Postulante'
order by t.name
FOR XML PATH(''), TYPE, root ('Root')

select 
    [Table].object_id [ObjectId],
	[Table].name [TableName], 
	SCHEMA_NAME([Table].schema_id) [SchemaName],
	[Column].name [ColumnName],
	TYPE_NAME([Column].user_type_id) [ColumnType],
	[Column].max_length [MaxLength],
	[Column].precision [Precision],
	[Column].scale [Scale],
	[Column].is_nullable [IsNullable],
	[Column].is_identity [IsIdentity]
from sys.tables [Table]
inner join sys.columns [Column] on [Table].object_id = [Column].object_id
where [Table].name in ('Actividad', 'ActRubroElegible', 'AE_Componente', 'AE_ComponenteValor', 'AE_Producto', 'AE_ProductoValor', 'AmbitoIntervencion', 'Anexo', 'AntecedenteEntidad', 'AporteActividad', 'AporteActividadPC', 'AporteActRubroElegible', 'AporteActRubroElegiblePC', 'AporteAreSubCategoria', 'AporteAreSubCategoriaPC', 'AporteComponente', 'AporteComponentePC', 'AporteProyecto', 'AporteProyectoPC', 'AreSubCategoria', 'AsignacionFC', 'AsignacionFCEvaluacion', 'AsignacionHistFC', 'CalificacionSubcriterio', 'ComentarioPostulante', 'ConsolidadoEvaluacion', 'ConsSubcriterio', 'Contrato', 'Convocatoria', 'ConvocatoriaChecklist', 'CorrEnvProyFondoConcursable', 'CorrInformeConformidadUD', 'Criterio', 'CriterioRevisionPreliminar', 'CronogramaActividad', 'CronogramaActRubroElegible', 'CronogramaAreSubCategoria', 'CronogramaComponente', 'CronogramaProyecto', 'Documento', 'EntidadOferente', 'EntidadParticipante', 'EtapaCadenaValor', 'EvaluadorFondoParticipa', 'EvaluadorPet', 'EvaluadorPetDeclaracion', 'EvaluadorPetFC', 'EvaluadorPNIA', 'FechaEvalacion', 'FondoConcursable', 'InformacionGeneral', 'InformacionGeneralEtapaCadenaValor', 'MarcoLogicoActividad', 'MarcoLogicoComponente', 'MarcoLogicoFinProyecto', 'MarcoLogicoObjetivoProyecto', 'MiembroEquipoFormadores', 'MiembroEquipoGestion', 'MiembroEquipoInvestigacion', 'MotivoHabilitarProyecto', 'ParametroSistema', 'PasoCritico', 'Persona', 'PlanCapacitacion', 'PlanNegocios', 'PlanServicios', 'PlanServiciosInvestigacion', 'Postulante', 'ProductoPlanNegocios', 'Proyecto', 'RevisionPreliminarPostuante', 'Rol', 'RolEquipoTecnico', 'RubroElegible', 'SIGProducto', 'Subcriterio', 'SubSector', 'Tabla', 'TipoCuadroControl', 'TipoInstitucion', 'TipoRubroElegible', 'Ubigeo', 'Usuario', 'UsuarioRol', 'ValoresTabla', 'ValorSubcriterio')
order by [Table].name
FOR XML AUTO, ELEMENTS, root ('DB')

select 
	t.object_id [ObjectId],
	t.name [TableName],
	i.name [IndexName],
	c.name [ColumnName],
	ty.name [ColumnType],
	c.max_length [MaxLength],
	c.precision [Precision],
	c.scale [Scale],
	c.is_nullable [IsNullable],
	c.is_identity [IsIdentity]
from sys.indexes i
inner join sys.tables t on i.object_id = t.object_id
inner join sys.index_columns ic on i.object_id = ic.object_id and i.index_id = ic.index_id
inner join sys.columns c on ic.object_id = c.object_id and ic.column_id = c.column_id
inner join sys.types ty on c.user_type_id = ty.user_type_id
where i.is_primary_key = 1
order by t.name, ic.key_ordinal

select 
	[PrimaryKey].object_id as [ObjectId],
	OBJECT_NAME([PrimaryKey].object_id) [TableName],
	[PrimaryKey].name [PrimaryKeyName],
	[Column].name [ColumnName],
	TYPE_NAME([Column].user_type_id) [ColumnType],
	[Column].max_length [MaxLength],
	[Column].precision [Precision],
	[Column].scale [Scale],
	[Column].is_nullable [IsNullable],
	[Column].is_identity [IsIdentity]
from sys.indexes [PrimaryKey]
inner join sys.tables [Table] on [PrimaryKey].object_id = [Table].object_id
inner join sys.index_columns ic on [PrimaryKey].object_id = ic.object_id and [PrimaryKey].index_id = ic.index_id
inner join sys.columns [Column] on ic.object_id = [Column].object_id and ic.column_id = [Column].column_id
inner join sys.types ty on [Column].user_type_id = ty.user_type_id
where [PrimaryKey].is_primary_key = 1
order by [Table].name, ic.key_ordinal
FOR XML AUTO, ELEMENTS, root ('DB')

select
    f.name [ForeignKeyName]  
   ,t.name AS [TableName]
   ,c.name [ConstraintColumnName]
   ,t.name AS [ReferencedTableName]
   ,cr.name AS [ReferencedColumnName]
   ,delete_referential_action_desc [DeleteAction]
   ,update_referential_action_desc  [UpdateAction]
from sys.foreign_keys AS f  
inner join sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id   
inner join sys.tables t on f.parent_object_id = t.object_id
inner join sys.columns c on fc.parent_object_id = c.object_id and fc.parent_column_id = c.column_id
inner join sys.tables tr on f.referenced_object_id = tr.object_id
inner join sys.columns cr on fc.referenced_object_id = cr.object_id and fc.referenced_column_id = cr.column_id
order by f.parent_object_id

select 
	p.object_id [ObjectId],
	p.name [StoreProcedureName],
	s.name [SchemaName],
	pa.name [ParameterName],
	ty.name [ParameterType],
	pa.max_length [MaxLength],
	pa.precision [Precision],
	pa.scale [Scale],
	pa.is_output [IsOutput]
from sys.procedures p
inner join sys.parameters pa on p.object_id = pa.object_id
inner join sys.types ty on pa.user_type_id = ty.user_type_id
inner join sys.schemas s on p.schema_id = s.schema_id
where p.type = 'P'

select 
	[StoreProcedure].object_id [ObjectId],
	[StoreProcedure].name [StoreProcedureName],
	--s.name [SchemaName],
	SCHEMA_NAME([StoreProcedure].schema_id) [SchemaName],
	[Parameter].name [ParameterName],
	--ty.name [ParameterType],
	TYPE_NAME([Parameter].user_type_id) [ParameterType],
	[Parameter].max_length [MaxLength],
	[Parameter].precision [Precision],
	[Parameter].scale [Scale],
	[Parameter].is_output [IsOutput]
from sys.procedures [StoreProcedure]
inner join sys.parameters [Parameter] on [StoreProcedure].object_id = [Parameter].object_id
inner join sys.types ty on [Parameter].user_type_id = ty.user_type_id
inner join sys.schemas s on [StoreProcedure].schema_id = s.schema_id
where [StoreProcedure].type = 'P'
FOR XML AUTO, ELEMENTS, root ('DB')

select
p.object_id [ObjectId],
p.name [StoreProcedureName],
d.definition
from sys.procedures p
inner join sys.sql_modules d on p.object_id = d.object_id

select
[StoreProcedureContent].object_id [ObjectId],
[StoreProcedureContent].name [StoreProcedureName],
[Content].definition
from sys.procedures [StoreProcedureContent]
inner join sys.sql_modules [Content] on [StoreProcedureContent].object_id = [Content].object_id
where [StoreProcedureContent].type = 'P'
FOR XML AUTO, ELEMENTS, root ('DB')

SELECT * FROM sys.sql_modules  
WHERE object_id = OBJECT_ID('usp_SEGAsociadoEntidad_GetList_rep_1');  


select * from sys.procedures
select * from sys.parameters

select * from sys.types
select * from sys.schemas
select * from sys.tables where object_id=16055143
select * from sys.columns
select * from sys.key_constraints
select * from sys.all_columns where object_id=32055200
select * from sys.indexes
select * from sys.index_columns

SELECT i.name AS IndexName, 
    OBJECT_NAME(ic.OBJECT_ID) AS TableName, 
    COL_NAME(ic.OBJECT_ID,ic.column_id) AS ColumnName, 
    c.is_identity, c.user_type_id, CAST(c.max_length AS int) AS max_length, 
    CAST(c.precision AS int) AS precision, CAST(c.scale AS int) AS scale 
FROM sys.indexes AS i 
INNER JOIN sys.index_columns AS ic 
INNER JOIN sys.columns AS c ON ic.object_id = c.object_id AND ic.column_id = c.column_id 
    ON i.OBJECT_ID = ic.OBJECT_ID AND i.index_id = ic.index_id 
WHERE i.is_primary_key = 1 --AND ic.OBJECT_ID = OBJECT_ID('Postulante')
ORDER BY OBJECT_NAME(ic.OBJECT_ID), ic.key_ordinal


GO
