class ContratosPdf < Prawn::Document

	def initialize(contratos)
		super(:top_margin => 70, :page_layout => :landscape)
		@contratos = contratos
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(contratos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [30,173,173,172,172]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def contratos_items
		[["ID","Proyecto - Código","Responsable del Contrato", "Fecha de Inicio", "Fecha de Finalización"]] +
		@contratos.map do |contrato|
			[contrato.id.to_s, contrato.proyecto.codigo, contrato.persona.nombre_y_apellido, contrato.fecha_inicio, contrato.fecha_fin]		
		end	
	end

end