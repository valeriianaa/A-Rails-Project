crumb :root do
  link "Inicio", root_path
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

#Proyectos-------------------------------------------

crumb :proyectos do
  link "Proyectos", proyectos_path
end

crumb :proyecto do |proyecto|
  link proyecto.nombre, proyecto_path(proyecto)
  parent :proyectos
end

crumb :actividades_proyectos do |proyecto|
  link "Actividades del proyecto", actividades_del_proyecto_path
  parent :proyecto, proyecto
end

crumb :actividad_proyecto do |proyecto|
  link "Actividad", actividad_proyecto_path(proyecto)
  parent :actividades_proyectos, proyecto
end

crumb :actividad_proyecto_editar do |proyecto|
  link "Editar", edit_actividad_proyecto_path(proyecto)
  parent :actividad_proyecto, proyecto
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