class EstadosPdf < Prawn::Document

	def initialize(estados)
		super(:top_margin => 70, :page_layout => :portrait)
		@estados = estados
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(estados_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [60,160,160,160]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def estados_items
		[["ID","Nombre","Estado Previo", "Ultimo"]] +
		@estados.map do |estado|
			retorno = ""
			if (estado.previous == nil) 
				retorno = "" 
			else
				retorno = "#{Estado.find(estado.previous).nombre}"
			end
			if (estado.ultimo == true)
				[estado.id.to_s, estado.nombre, retorno, "Sí"]
			else
				[estado.id.to_s, estado.nombre, retorno,"No"]
			end		
		end
	end

end