class EventosPdf < Prawn::Document

	def initialize(eventos)
		super(:top_margin => 70, :page_layout => :landscape)
		@eventos = eventos
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(eventos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [30,170,240,80,70,65,65]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def eventos_items
		[["ID","Código","Nombre","Descripción", "Dia", "Hora", "Exposiores"]] +
		@eventos.map do |evento|
			retorno = ""
			if (evento.personas == nil)
				retorno = retorno + "" 
			else
				evento.personas do |a|
					retorno = retorno + "#{a.nombre_y_apellido} \n"
				end
			end
			[evento.id.to_s, evento.codigo, evento.nombre, evento.descripcion, evento.dia, evento.hora, retorno]
		end	
	end

end