class ConceptosDePagoPdf < Prawn::Document

	def initialize(conceptos_de_pago)
		super(:top_margin => 70, :page_layout => :landscape)
		@conceptos_de_pago = conceptos_de_pago
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(conceptos_de_pago_items,{:cell_style =>{:size => 8}} ) do |t|
			t.column_widths = [30,60,150,190,70]
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
		end
	end

	def conceptos_de_pago_items
		[["ID","Código","Nombre", "Descripción", "Monto", "Vencimientos"]] +
		@conceptos_de_pago.map do |concepto|
			retorno = ""
			if (concepto.vencimientos == nil)
				retorno = retorno + "" 
			else
				concepto.vencimientos.map do |a|
					retorno = retorno + "Fecha: #{a.fecha.strftime('%d-%m-%y')} - Porcenteaje de Interés: #{a.interes.porcentaje} \n"
				end
			end
			[concepto.id, concepto.codigo, concepto.nombre, concepto.descripcion, concepto.monto, retorno]
		end	
	end
end