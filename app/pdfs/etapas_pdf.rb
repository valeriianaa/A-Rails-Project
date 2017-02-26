class EtapasPdf < Prawn::Document

	def initialize(etapas)
		super(:top_margin => 70, :page_layout => :portrait)
		@etapas = etapas
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(etapas_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [60,160,160,160]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def etapas_items
		[["ID","Nombre","Estado Previo", "Ultimo"]] +
		@etapas.map do |etapa|
			retorno = ""
			if (etapa.etapaAnterior == nil) 
				retorno = "" 
			else
				retorno = "#{Etapa.find(etapa.etapaAnterior).nombre}"
			end
			[etapa.id.to_s, etapa.nombre, etapa.descripcion, retorno]
		end
	end

end