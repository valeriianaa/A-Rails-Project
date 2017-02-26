class CuentasPdf < Prawn::Document

	def initialize(cuentas)
		super(:top_margin => 70, :page_layout => :portrait)
		@cuentas = cuentas
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(cuentas_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [60,240,240]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def cuentas_items
		[["ID","Proyecto - Código","Saldo"]] +
		@cuentas.map do |cuenta|
			[cuenta.id.to_s, cuenta.proyecto.codigo, cuenta.saldo]		
		end	
	end

end