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
	inflect.irregular 'error', 'errores'
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
	inflect.irregular 'CuotaPorCliente', 'CuotasPorCliente'
	inflect.irregular 'cuota_por_cliente', 'cuotas_por_cliente'
	inflect.irregular 'contacto', 'contactos'
	inflect.irregular 'evento', 'eventos'
	inflect.irregular 'especialidad_de_contacto', 'especialidades_de_contacto'
	inflect.irregular 'EspecialidadDeContacto', 'EspecialidadesDeContacto'
	inflect.irregular 'historial', 'historiales'
	inflect.irregular 'tipo_de_pago', 'tipos_de_pago'
	inflect.irregular 'TipoDePago', 'TiposDePago'
	inflect.irregular 'interes', 'intereses'
	inflect.irregular 'descuento', 'descuentos'
	inflect.irregular 'EventoProyecto', 'EventosProyectos'
	inflect.irregular 'evento_proyecto', 'eventos_proyectos'
	inflect.irregular 'accion', 'acciones'
	inflect.irregular 'modelo', 'modelos'
	inflect.irregular 'permiso', 'permisos'
	inflect.irregular 'rol', 'roles'
	inflect.irregular 'configuracion','configuraciones'
	inflect.irregular 'PagoMetodo','PagosMetodos'
	inflect.irregular 'pago_metodo','pagos_metodos'
	inflect.irregular 'cuenta', 'cuentas'
end