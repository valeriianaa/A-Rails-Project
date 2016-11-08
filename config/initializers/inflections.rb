# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections(:en) do |inflect|
	#inflect.irregular 'categoria', 'categorias'
	inflect.irregular 'pais', 'paises'
	inflect.irregular 'provincia', 'provincias'
	inflect.irregular 'ciudad', 'ciudades'
	inflect.irregular 'miembro_equipo', 'miembros_equipo'
	inflect.irregular 'MiembroEquipo', 'MiembrosEquipo'
	inflect.irregular 'actividad', 'actividades'
	inflect.irregular 'persona_proyecto', 'personas_proyectos'
	inflect.irregular 'PersonaProyecto', 'PersonasProyectos'
	inflect.irregular 'actividad_proyecto', 'actividades_proyectos'
	inflect.irregular 'ActividadProyecto', 'ActividadesProyectos'
	inflect.irregular 'rol_de_empleado', 'roles_de_empleados'
	inflect.irregular 'RolDeEmpleado', 'RolesDeEmpleados'
	inflect.irregular 'concepto_de_pago', 'conceptos_de_pago'
	inflect.irregular 'ConceptoDePago', 'ConceptosDePago'
	inflect.irregular 'contrato', 'contratos'
	inflect.irregular 'PagoRealizado', 'PagosRealizados'
	inflect.irregular 'pago_realizado', 'pagos_realizados'
	inflect.irregular 'contacto', 'contactos'
	inflect.irregular 'evento', 'eventos'
	inflect.irregular 'especialidad_de_contacto', 'especialidades_de_contacto'
	inflect.irregular 'EspecialidadDeContacto', 'EspecialidadesDeContacto'
end