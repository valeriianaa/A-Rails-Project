class CuotasPorClientePdf < Prawn::Document

	def initialize(cuotas_por_cliente)
		super(:top_margin => 70, :page_layout => :landscape)
		@cuotas_por_cliente = cuotas_por_cliente
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(cuotas_por_cliente_items,{:cell_style =>{:size => 8}} ) do |t|
			t.column_widths = [30,98,98,98,58,228,98]
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
		end
	end

	def cuotas_por_cliente_items
		[["ID","Proyecto - Código","Concepto - Código","Nombre", "Monto", "Vencimientos", "MontoTotal"]] +
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