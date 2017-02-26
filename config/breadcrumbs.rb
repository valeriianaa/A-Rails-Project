crumb :root do
  link "Inicio", root_path
end

#Acciones--------------------------------------------
crumb :acciones do
  link "Acciones", acciones_path
end

crumb :accion do |accion|
  link accion.nombre, accion
  parent :acciones
end

crumb :accion_edit do |accion|
  link "Editar", accion
  parent :acciones
end

crumb :accion_new do 
  link "Nuevo"
  parent :acciones
end

#Actividades--------------------------------------------
crumb :actividades do
  link "Actividades", actividades_path
end

crumb :actividad do |actividad|
  link actividad.nombre, actividad
  parent :actividades
end

crumb :actividad_edit do |actividad|
  link "Editar", actividad
  parent :actividades
end

crumb :actividad_new do 
  link "Nuevo"
  parent :actividades
end

crumb :actividad_auditorias do 
  link "Auditorías"
  parent :actividades
end

#Areas--------------------------------------------
crumb :areas do
  link "Areas", areas_path
end

crumb :area do |area|
  link area.nombre, area
  parent :areas
end

crumb :area_edit do |area|
  link "Editar", area
  parent :areas
end

crumb :area_new do 
  link "Nuevo"
  parent :areas
end

#Ciudades--------------------------------------------
crumb :ciudades do
  link "Ciudades", ciudades_path
end

crumb :ciudad do |ciudad|
  link ciudad.nombre, ciudad
  parent :ciudades
end

crumb :ciudad_edit do |ciudad|
  link "Editar", ciudad
  parent :ciudades
end

crumb :ciudad_new do 
  link "Nuevo"
  parent :ciudades
end

#Condeptos de pago--------------------------------------------
crumb :conceptos_de_pago do
  link "Conceptos de pago", conceptos_de_pago_path
end

crumb :concepto_de_pago do |concepto_de_pago|
  link concepto_de_pago.codigo, concepto_de_pago
  parent :conceptos_de_pago
end

crumb :concepto_de_pago_edit do |concepto_de_pago|
  link "Editar", concepto_de_pago
  parent :conceptos_de_pago
end

crumb :concepto_de_pago_new do 
  link "Nuevo"
  parent :conceptos_de_pago
end

crumb :conceptos_auditorias do 
  link "Auditorías"
  parent :conceptos_de_pago
end

#Configuraciones-------------------------------------------

crumb :configuracion_edit do |configuracion|
  link "Datos de la compañía", configuracion
  parent
end

crumb :configuracion_new do 
  link "Datos de la compañía"
  parent
end

#Contactos--------------------------------------------
crumb :contactos do
  link "Contactos", contactos_path
end

crumb :contacto do |contacto|
  link contacto.codigo, contacto
  parent :contactos
end

crumb :contacto_edit do |contacto|
  link "Editar", contacto
  parent :contactos
end

crumb :contacto_new do 
  link "Nuevo"
  parent :contactos
end

crumb :contacto_auditorias do 
  link "Auditorías"
  parent :contactos
end

#Contratos--------------------------------------------
crumb :contratos do
  link "Contratos", contratos_path
end

crumb :contrato do |contrato|
  link contrato.proyecto.codigo, contrato
  parent :contratos
end

crumb :contrato_edit do |contrato|
  link "Editar", contrato
  parent :contratos
end

crumb :contrato_new do 
  link "Nuevo"
  parent :contratos
end

crumb :contrato_auditorias do 
  link "Auditorías"
  parent :contratos
end
#Cuentas--------------------------------------------
crumb :cuentas do
  link "Cuentas", cuentas_path
end

crumb :cuenta do |cuenta|
  link cuenta.proyecto.codigo, cuenta
  parent :cuentas
end

crumb :cuenta_edit do |cuenta|
  link "Editar", cuenta
  parent :cuentas
end

crumb :cuenta_new do 
  link "Nuevo"
  parent :cuentas
end

crumb :cuenta_auditorias do 
  link "Auditorías"
  parent :cuentas
end

#Departamentos--------------------------------------------
crumb :departamentos do
  link "Departamentos", departamentos_path
end

crumb :departamento do |departamento|
  link departamento.nombre, departamento
  parent :departamentos
end

crumb :departamento_edit do |departamento|
  link "Editar", departamento
  parent :departamentos
end

crumb :departamento_new do 
  link "Nuevo"
  parent :departamentos
end

crumb :departamento_auditorias do 
  link "Auditorías"
  parent :departamentos
end

#Descuentos--------------------------------------------
crumb :descuentos do
  link "Descuentos", descuentos_path
end

crumb :descuento do |descuento|
  link descuento.nombre, descuento
  parent :descuentos
end

crumb :descuento_edit do |descuento|
  link "Editar", descuento
  parent :descuentos
end

crumb :descuento_new do 
  link "Nuevo"
  parent :descuentos
end

crumb :descuento_auditorias do 
  link "Auditorías"
  parent :descuentos
end

#Empleados-------------------------------------------
crumb :empleados do
  link "Empleados", empleados_path
end

crumb :empleado do |empleado|
  link empleado.nombre_y_apellido, empleado
  parent :empleados
end

crumb :empleado_edit do |empleado|
  link "Editar", empleado
  parent :empleados
end

crumb :empleado_new do 
  link "Nuevo"
  parent :empleados
end

crumb :empleados_auditorias do 
  link "Auditorías"
  parent :empleados
end

#Especialidades--------------------------------------------
crumb :especialidades_de_contacto do
  link "Especialidades", especialidades_de_contacto_path
end

crumb :especialidad_de_contacto do |especialidad_de_contacto|
  link especialidad_de_contacto.nombre, especialidad_de_contacto
  parent :especialidades_de_contacto
end

crumb :especialidad_de_contacto_edit do |especialidad_de_contacto|
  link "Editar", especialidad_de_contacto
  parent :especialidades_de_contacto
end

crumb :especialidad_de_contacto_new do 
  link "Nuevo"
  parent :especialidades_de_contacto
end

crumb :especialidad_de_contacto_auditorias do 
  link "Auditorías"
  parent :especialidades_de_contacto
end
#Estados--------------------------------------------
crumb :estados do
  link "Estados", estados_path
end

crumb :estado do |estado|
  link estado.nombre, estado
  parent :estados
end

crumb :estado_edit do |estado|
  link "Editar", estado
  parent :estados
end

crumb :estado_new do 
  link "Nuevo"
  parent :estados
end

crumb :estados_auditorias do 
  link "Auditorías"
  parent :estados
end

#Etapas--------------------------------------------
crumb :etapas do
  link "Etapas", etapas_path
end

crumb :etapa do |etapa|
  link etapa.nombre, etapa
  parent :etapas
end

crumb :etapa_edit do |etapa|
  link "Editar", etapa
  parent :etapas
end

crumb :etapa_new do 
  link "Nuevo"
  parent :etapas
end

crumb :etapas_auditorias do 
  link "Auditorías"
  parent :etapas
end

#Eventos--------------------------------------------
crumb :eventos do
  link "Eventos", eventos_path
end

crumb :evento do |evento|
  link evento.codigo, evento
  parent :eventos
end

crumb :evento_edit do |evento|
  link "Editar", evento
  parent :eventos
end

crumb :evento_new do 
  link "Nuevo"
  parent :eventos
end

crumb :eventos_auditorias do 
  link "Auditorías"
  parent :eventos
end

#EventosProyectos--------------------------------------------
crumb :eventos_proyectos do
  link "Eventos asociados a proyectos", eventos_proyectos_path
end

crumb :evento_proyecto do |evento_proyecto|
  link evento_proyecto.evento.codigo, evento_proyecto
  parent :eventos_proyectos
end

crumb :evento_proyecto_new do 
  link "Nuevo"
  parent :eventos
end

#Intereses--------------------------------------------
crumb :intereses do
  link "Intereses", intereses_path
end

crumb :interes do |interes|
  link interes.nombre, interes
  parent :intereses
end

crumb :interes_edit do |interes|
  link "Editar", interes
  parent :intereses
end

crumb :interes_new do 
  link "Nuevo"
  parent :intereses
end

crumb :intereses_auditorias do 
  link "Auditorías"
  parent :intereses
end


#Miembros de Equipo--------------------------------------------
crumb :miembros_equipo do
  link "Miembros de Equipo", miembros_equipo_path
end

crumb :miembro_equipo do |miembro_equipo|
  link miembro_equipo.codigo, miembro_equipo
  parent :miembros_equipo
end

crumb :miembro_equipo_edit do |miembro_equipo|
  link "Editar", miembro_equipo
  parent :miembros_equipo
end

crumb :miembro_equipo_new do 
  link "Nuevo"
  parent :miembros_equipo
end

crumb :miembros_equipo_auditorias do 
  link "Auditorías"
  parent :miembros_equipo
end

#Modelos--------------------------------------------
crumb :modelos do
  link "Modelos", modelos_path
end

crumb :modelo do |modelo|
  link modelo.nombre, modelo
  parent :modelos
end

crumb :modelo_edit do |modelo|
  link "Editar", modelo
  parent :modelos
end

crumb :modelo_new do 
  link "Nuevo"
  parent :modelos
end

#Pagos--------------------------------------------
crumb :pagos do
  link "Pagos", pagos_path
end

crumb :pago do |pago|
  link pago.id, pago
  parent :pagos
end

crumb :pago_new do 
  link "Nuevo"
  parent :pagos
end

crumb :pagos_auditorias do 
  link "Auditorías"
  parent :pagos
end
#Paises--------------------------------------------
crumb :paises do
  link "Paises", paises_path
end

crumb :pais do |pais|
  link pais.nombre, pais
  parent :paises
end

crumb :pais_edit do |pais|
  link "Editar", pais
  parent :paises
end

crumb :pais_new do 
  link "Nuevo"
  parent :paises
end

#Provincias--------------------------------------------
crumb :provincias do
  link "Provincias", provincias_path
end

crumb :provincia do |provincia|
  link provincia.nombre, provincia
  parent :provincias
end

crumb :provincia_edit do |provincia|
  link "Editar", provincia
  parent :provincias
end

crumb :provincia_new do 
  link "Nuevo"
  parent :provincias
end

#Proyectos-------------------------------------------

crumb :proyectos do
  link "Proyectos", proyectos_path
end

crumb :proyecto do |proyecto|
  link proyecto.codigo, proyecto_path(proyecto)
  parent :proyectos
end

crumb :actividades_proyectos do |proyecto|
  link "Actividades del proyecto", actividades_del_proyecto_path(proyecto)
  parent :proyecto, proyecto
end

crumb :actividad_proyecto do |actividad_proyecto|
  link "Actividad", actividad_proyecto_path(actividad_proyecto)
  parent :actividades_proyectos, actividad_proyecto.proyecto
end

crumb :actividad_proyecto_editar do |actividad_proyecto|
  link "Editar", edit_actividad_proyecto_path(actividad_proyecto)
  parent :actividad_proyecto, actividad_proyecto
end

crumb :proyectos_estadisticas do |proyecto|
  link "Contratos del proyecto", proyecto_estadisticas_path(proyecto)
  parent :proyecto, proyecto
end

crumb :proyectos_contratos do |proyecto|
  link "Contratos del proyecto", proyecto_contratos_path(proyecto)
  parent :proyecto, proyecto
end

crumb :proyectos_pagos do |proyecto|
  link "Contratos del proyecto", proyecto_pagos_path(proyecto)
  parent :proyecto, proyecto
end

crumb :proyectos_eventos do |proyecto|
  link "Contratos del proyecto", proyecto_eventos_path(proyecto)
  parent :proyecto, proyecto
end

#cuotas-------------
crumb :proyectos_cuotas do |proyecto|
  link "Cuotas del proyecto", proyecto_cuotas_por_cliente_path(proyecto)
  parent :proyecto, proyecto
end

crumb :cuota do |cuota|
  link cuota.concepto_de_pago.codigo, proyecto_cuota_por_cliente_path(cuota.proyecto, cuota)
  parent :proyectos_cuotas, cuota.proyecto
end

crumb :cuota_new do |proyecto|
  link "Nuevo", new_proyecto_cuota_por_cliente_path(proyecto)
  parent :proyectos_cuotas, proyecto
end

crumb :cuota_auditoria do |proyecto|
  link "Auditorías", cuotas_por_cliente_audited_path(proyecto)
  parent :proyectos_cuotas, proyecto
end

#Roles--------------------------------------------
crumb :roles do
  link "Roles", roles_path
end

crumb :rol do |rol|
  link rol.nombre, rol
  parent :roles
end

crumb :rol_edit do |rol|
  link "Editar", rol
  parent :roles
end

crumb :rol_new do 
  link "Nuevo"
  parent :roles
end

#Rolesde empleados--------------------------------------------
crumb :roles_de_empleados do
  link "Roles de empleados", roles_de_empleados_path
end

crumb :rol_de_empleado do |rol_de_empleado|
  link rol_de_empleado.nombre, rol_de_empleado
  parent :roles_de_empleados
end

crumb :rol_de_empleado_edit do |rol_de_empleado|
  link "Editar", rol_de_empleado
  parent :roles_de_empleados
end

crumb :rol_de_empleado_new do 
  link "Nuevo"
  parent :roles_de_empleados
end

crumb :roles_de_empleado_auditorias do 
  link "Auditorías"
  parent :roles_de_empleados
end
#Systemsettings--------------------------------------------

crumb :systemsetting_edit do |systemsetting|
  link "Configuración del sistema", systemsetting
  parent 
end

crumb :systemsetting_new do 
  link "Configuración del sistema"
  parent 
end

#Tipos de Documento--------------------------------------------
crumb :tipo_documentos do
  link "Tipos de Documento", tipo_documentos_path
end

crumb :tipo_documento do |tipo_documento|
  link tipo_documento.nombre, tipo_documento
  parent :tipo_documentos
end

crumb :tipo_documento_edit do |tipo_documento|
  link "Editar", tipo_documento
  parent :tipo_documentos
end

crumb :tipo_documento_new do 
  link "Nuevo"
  parent :tipo_documentos
end

#Tipos de Pago--------------------------------------------
crumb :tipos_de_pago do
  link "Tipos de Pago", tipos_de_pago_path
end

crumb :tipo_de_pago do |tipo_de_pago|
  link tipo_de_pago.nombre, tipo_de_pago
  parent :tipos_de_pago
end

crumb :tipo_de_pago_edit do |tipo_de_pago|
  link "Editar", tipo_de_pago
  parent :tipos_de_pago
end

crumb :tipo_de_pago_new do 
  link "Nuevo"
  parent :tipos_de_pago
end

crumb :tipos_de_pago_auditorias do 
  link "Auditorías"
  parent :tipos_de_pago
end

#Usuarios--------------------------------------------
crumb :users do
  link "Usuarios", users_path
end

crumb :user do |user|
  link user.id, user
  parent :users
end

crumb :user_edit do |user|
  link "Editar", user
  parent :users
end

crumb :user_new do 
  link "Nuevo"
  parent :users
end




























# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).