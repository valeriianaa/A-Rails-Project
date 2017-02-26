class EspecialidadesDeContactoPdf < Prawn::Document

	def initialize(especialidades_de_contacto)
		super(:top_margin => 70, :page_layout => :portrait)
		@especialidades_de_contacto = especialidades_de_contacto
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(especialidades_de_contacto_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [60,240,240]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def especialidades_de_contacto_items
		[["ID","Nombre", "Descripción"]] +
		@especialidades_de_contacto.map do |esp|
			[esp.id.to_s, esp.nombre, esp.descripcion]		
		end	
	end

end