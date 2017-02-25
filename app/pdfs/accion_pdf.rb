class AccionPdf < Prawn::Document

	def initialize(accion)
		super(top_margin: 70)
		@accion = accion
		#detalle_top
		detalle_accion
		table_modelos
	end

	def detalle_accion
		table([[{:content => "Accion Id N°: #{@accion.id}", :colspan => 2}],["Nombre", "#{@accion.nombre}"],["Palabra Clave", "#{@accion.key_name}"]]) do |t|
			t.width = bounds.width
			t.column(0).font_style = :bold
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
		end
	end

	def table_modelos
		move_down 5
		table([[{:content => "Modelos Asociados", :colspan => 2}]]) do |t|
			t.column(0).font_style = :bold
			t.column(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.width = bounds.width
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
		end	
		table(modelos_items,{:cell_style =>{:size => 12}} ) do |t|
			t.width = bounds.width
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
		end	
	end

	def modelos_items
		@accion.modelos.map do |modelo|
			["Modelo",modelo.nombre]
		end	
	end
end