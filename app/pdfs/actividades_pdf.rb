class ActividadesPdf < Prawn::Document

	def initialize(actividades)
		super(:top_margin => 70, :page_layout => :landscape)
		@actividades = actividades
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(actividades_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [30,170,240,80,70,130]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def actividades_items
		[["ID","Nombre","Descripción", "Etapa", "Obligatorio", "Antecedentes"]] +
		@actividades.map do |actividad|
			retorno = ""
			if (actividad.actividades_antecedentes == nil) or (actividad.actividades_antecedentes == [])
				retorno = retorno + "" 
			else
				actividad.actividades_antecedentes.map do |a|
					retorno = retorno + "#{Actividad.find(a).nombre} \n"
				end
			end
			if (actividad.obligatorio == true)
				[actividad.id.to_s, actividad.nombre, actividad.descripcion, actividad.etapa.nombre, "Sí", retorno]
			else
				[actividad.id.to_s, actividad.nombre, actividad.descripcion, actividad.etapa.nombre, "No", retorno]
			end		
		end	
	end

end