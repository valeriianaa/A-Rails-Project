class TiposDePagoPdf < Prawn::Document

	def initialize(tipos_de_pago)
		super(:top_margin => 70, :page_layout => :portrait)
		@tipos_de_pago = tipos_de_pago
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(tipos_de_pago_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [60,480]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def tipos_de_pago_items
		[["ID","Nombre"]] +
		@tipos_de_pago.map do |tp|
			[tp.id.to_s, tp.nombre]		
		end	
	end

end