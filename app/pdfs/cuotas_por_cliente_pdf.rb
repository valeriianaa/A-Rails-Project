class CuotasPorClientePdf < Prawn::Document

	def initialize(cuotas_por_cliente, usuario)
		super(:top_margin => 30, :page_layout => :landscape)
		@cuotas_por_cliente = cuotas_por_cliente
		@usuario = usuario
		fecha_impresion
		encabezado_horizontal
		titulo_reporte
		renderizar_tabla
		text "Reporte generado por usuario: #{Persona.find(@usuario.persona_id).nombre_y_apellido}", size: 8, :align => :left, :valign => :bottom
		number_pages "Página <page> de <total>", size: 8, at: [bounds.right - 50, 5]
	end

	def fecha_impresion
		text "#{I18n.l(Time.now, format: :long)}", size: 8, :align => :right, :valign => :top
	end

	def encabezado_horizontal
		if Configuracion.count > 0
			c = Configuracion.last
			image_path = Configuracion.last.logotipo.current_path 
 			image image_path, :scale => 0.3, :align => :left, :valign => :top
 			a = "#{c.nombre} - #{c.eslogan}"
 			if width_of(a) > bounds.width
 				a = "#{c.nombre}"
 			end
			text_box a, :at => [(bounds.width - (width_of(a) + (bounds.width - width_of(a))/2)).round, bounds.top - 30], :width => width_of(a)
		end
	end

	def titulo_reporte
		move_down 35
		text "Todas las Cuotas del proyecto", size: 12, :align =>:left
	end

	def renderizar_tabla
		move_down 5
		table(cuotas_por_cliente_items,{:cell_style =>{:size => 8}} ) do |t|
			t.column_widths = [30,98,98,98,58,228,98]
			t.row(0).font_style = :bold
			t.row(0).align = :center
			t.row(0).background_color = "f4f4f4"
		end
	end

	def cuotas_por_cliente_items
		[["ID","Proyecto - Código","Concepto - Código","Nombre", "Monto", "Vencimientos", "Monto Total"]] +
		@cuotas_por_cliente.map do |cuota|
			retorno = ""
			if (cuota.concepto_de_pago.vencimientos == nil)
				retorno = retorno + "" 
			else
				cuota.concepto_de_pago.vencimientos.map do |a|
					if a.fecha < Date.today
						retorno = retorno + "Fecha: #{a.fecha.strftime('%d-%m-%y')} - Porcenteaje de Interés: #{a.interes.porcentaje} \n"
					end
				end
			end
			[cuota.id, cuota.proyecto.codigo, cuota.concepto_de_pago.codigo, cuota.concepto_de_pago.nombre, cuota.concepto_de_pago.monto, retorno, cuota.montoTotal]
		end	
	end
end