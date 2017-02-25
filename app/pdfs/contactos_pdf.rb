class ContactosPdf < Prawn::Document

	def initialize(contactos)
		super(:top_margin => 70, :page_layout => :landscape)
		@contactos = contactos
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(contactos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
		end
	end

	def contactos_items
		[["ID","Nombre","Apellido", "Tipo y N° Doc","Dirección","Teléfono","Correo Electronico", "Especialidad"]] +
		@contactos.map do |contacto|
			retorno = ""
			if (contacto.especialidad_de_contacto == nil)
				retorno = retorno + "" 
			else
				contacto.especialidad_de_contacto.map do |a|
					retorno = retorno + "#{a.nombre} \n"
				end
			end
			[contacto.id, contacto.nombre, contacto.apellido, "#{contacto.tipo_documento.nombre} #{contacto.nroIdentificacion}", "#{contacto.calle}, #{contacto.nroDomicilio} piso:#{contacto.piso} dpto:#{contacto.dpto}",contacto.telefono, contacto.email, retorno]
		end	
	end
end