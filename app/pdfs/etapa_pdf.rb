class EtapaPdf < Prawn::Document

	def initialize(etapa)
		super(top_margin: 70, :page_layout => :landscape)
		@etapa = etapa
		#detalle_top
		detalle_etapa
		table_proyectos
	end

	def detalle_etapa
		table([[{:content => "Proyectos de la Etapa", :colspan => 2}],["Etapa nombre: ", "#{@etapa.nombre}"]]) do |t|
			t.width = bounds.width
			t.column(0).font_style = :bold
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
		end
	end

	def table_proyectos
		move_down 5
		table(proyectos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [50, 134, 134, 134, 134, 134]
			t.row(0).background_color = "f4f4f4"
		end
	end

	def proyectos_items
		[["Codigo","Nombre","Dirección","Teléfono","Correo Electronico", "Página web"]] +
		@etapa.proyectos.map do |proyecto|
			[proyecto.codigo, proyecto.nombre, "#{proyecto.calle}, #{proyecto.nroDomicilio} piso:#{proyecto.piso} dpto:#{proyecto.dpto}", proyecto.telefono, proyecto.email, proyecto.pagWeb]
		end	
	end
end