class MiembrosEquipoPdf < Prawn::Document

	def initialize(miembros_equipo)
		super(:top_margin => 70, :page_layout => :landscape)
		@miembros_equipo = miembros_equipo
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(miembros_equipo_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
		end
	end

	def miembros_equipo_items
		[["ID","Codigo","Nombre","Apellido", "Tipo y N° Doc", "Dirección","Teléfono","Correo Electronico"]] +
		@miembros_equipo.map do |miembro_equipo|
			[miembro_equipo.id, miembro_equipo.codigo, miembro_equipo.nombre, miembro_equipo.apellido, "#{miembro_equipo.tipo_documento.nombre} #{miembro_equipo.nroIdentificacion}", "#{miembro_equipo.calle}, #{miembro_equipo.nroDomicilio} piso:#{miembro_equipo.piso} dpto:#{miembro_equipo.dpto}",miembro_equipo.telefono, miembro_equipo.email]
		end	
	end
end