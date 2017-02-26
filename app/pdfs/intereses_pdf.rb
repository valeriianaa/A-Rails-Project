class InteresesPdf < Prawn::Document

	def initialize(intereses)
		super(:top_margin => 70, :page_layout => :portrait)
		@intereses = intereses
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(intereses_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [60,240,240]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def intereses_items
		[["ID","Nombre", "Porcentaje"]] +
		@intereses.map do |intereses|
			[intereses.id.to_s, intereses.nombre, intereses.porcentaje]		
		end	
	end

end