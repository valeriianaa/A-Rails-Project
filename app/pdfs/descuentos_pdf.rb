class DescuentosPdf < Prawn::Document

	def initialize(descuentos)
		super(:top_margin => 70, :page_layout => :portrait)
		@descuentos = descuentos
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(descuentos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [60,240,240]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def descuentos_items
		[["ID","Nombre", "Porcentaje"]] +
		@descuentos.map do |descuento|
			[descuento.id.to_s, descuento.nombre, descuento.porcentaje]		
		end	
	end

end