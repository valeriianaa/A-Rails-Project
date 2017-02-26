class ModeloPdf < Prawn::Document

	def initialize(modelo)
		super(top_margin: 70)
		@modelo = modelo
		#detalle_top
		detalle_modelo
		table_modelos
	end

	def detalle_modelo
		table([[{:content => "Modelo Id N°: #{@modelo.id}", :colspan => 2}],["Nombre", "#{@modelo.nombre}"]]) do |t|
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
		@modelo.acciones.map do |accion|
			["Modelo",accion.nombre]
		end	
	end
end