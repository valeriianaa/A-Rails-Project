class DepartamentosPdf < Prawn::Document

	def initialize(departamentos)
		super(:top_margin => 70, :page_layout => :portrait)
		@departamentos = departamentos
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(departamentos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [60,480]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def departamentos_items
		[["ID","Nombre"]] +
		@departamentos.map do |departamento|
			[departamento.id.to_s, departamento.nombre]		
		end	
	end

end