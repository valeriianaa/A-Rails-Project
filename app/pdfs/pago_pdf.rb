class PagoPdf < Prawn::Document

	def initialize(pago)
		super(top_margin: 70)
		@pago = pago
		detalle_top
		detalle_items
		detalle_bottom
	end

	def detalle_top
		text "RECIBO DE PAGO", size: 12, :align =>:center, :valign => :top
	end
	
	def detalle_bottom
		text "Documento no válido como factura", size: 8,:align =>:center, :valign => :bottom
	end

	def detalle_items
		move_down 20
		table([ [empresa_detalles, pago_numero]]) do |t|
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
			t.width = bounds.width
			t.row(0).font_size = 30
			t.row(0).font_style = :bold
			t.row(0).padding = 50
		end

		move_down 5
		table([["Proyecto" , "#{@pago.proyecto.codigo} #{@pago.proyecto.nombre}"]]) do |t|
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
			t.width = bounds.width
			t.column(0).font_style = :bold
			t.column(0).background_color = "f4f4f4"
			t.column(1).align = :right
		end

		move_down 5
		table([["Responsable del Contrato" , "#{@pago.persona.nombre_y_apellido}"]]) do |t|
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
			t.width = bounds.width
			t.column(0).font_style = :bold
			t.column(0).background_color = "f4f4f4"
			t.column(1).align = :right
		end
		
		move_down 20
		table(cuotas_items_rows) do |t|
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
			t.width = bounds.width
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.row(1).font_style = :bold
			t.column(1).align = :right
			t.row(1).align = :center
		end
		
		move_down 5
		table(pagos_metodos_items_rows) do |t|
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
			t.width = bounds.width
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.row(1).font_style = :bold
			t.column(1).align = :right
			t.row(1).align = :center
		end
		
		move_down 20
		table([["Son $: ", "#{@pago.monto}" ],["Saldo actual en la cuenta del responsable: ", "+ #{@pago.cuenta.saldo}"]]) do |t|
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
			t.width = bounds.width
			t.column(0).font_style = :bold
			t.column(0).background_color = "f4f4f4"
			t.column(1).align = :right
		end
	end

	def pago_numero
		[ ["Fecha: #{@pago.fecha}"], ["Recibo N°: #{@pago.id}"], ["..."] ]
	end

	def empresa_detalles
		if Configuracion.count > 0
			c = Configuracion.last
			return [ ["#{c.nombre}"], ["#{c.condicion_iva.capitalize}"], [{:image => c.logo, :scale => 0.5}] ]
		else
			return [["##--##"],["##--##"],["##--##"]]
		end
		
	end

	def cuotas_items_rows
		[[{:content => "Concepto de pago", :colspan => 2}],["Detalle", "Importe"]] +
		@pago.cuotas_por_cliente.map do |cuota|
			[cuota.concepto_de_pago.nombre, cuota.concepto_de_pago.monto]
		end	
	end

	def pagos_metodos_items_rows
		[[{:content => "Forma de pago", :colspan => 2}],["Detalle", "Importe"]] +
		@pago.pagos_metodos.map do |pm|
			[pm.tipo_de_pago.nombre, pm.monto]
		end	
	end
end