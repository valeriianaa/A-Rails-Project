class ActividadesProyectoPdf < Prawn::Document

	def initialize(proyecto)
		super(top_margin: 70, :page_layout => :landscape)
		@proyecto = proyecto
		if Configuracion.count > 0
			detalle_top
		end
		detalle_proyecto
		table_actividades_proyectos
	end

	def detalle_top
		c = Configuracion.last
		table([[{:image => c.logotipo.current_path} ,c.nombre]])
		move_down 20
	end

	def detalle_proyecto
		retorno = ""
		@proyecto.miembros_equipo.each do |m|
			retorno = retorno + "#{m.nombre_y_apellido} \n"
		end
		table([[{:content => "Proyecto Código: #{@proyecto.codigo}", :colspan => 2}],["Nombre", "#{@proyecto.nombre}"], ["Descripción", "#{@proyecto.descripcion}"], ["Miembros de Equipo", retorno]]) do |t|
			t.width = bounds.width
			t.column(0).font_style = :bold
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.column_widths = [(bounds.width*0.3), (bounds.width* 0.7)]
		end
	end

	def table_actividades_proyectos
		move_down 5
		table([["Actividades del Proyecto"]]) do |t|
			t.width = bounds.width
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
		end
		table(actividades_proyectos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [100,124,124,124,124,124]
			t.row(0).background_color = "f4f4f4"
		end
	end

	def actividades_proyectos_items
		[["Etapa","Actividad", "Estado de la Actividad","Fecha Vencimiento","Atrasado","Fecha de la última actualización"]] +
		@proyecto.actividades_proyectos.order(:actividad_id).map do |ap|
			retorno_atrasado, retorno_estado, retorno_fvenc, retorno_fultact = ""
			if ap.actividad_atrasada == true
            	retorno_atrasado = "Atrasado"
            elsif (ap.estado != nil) and (ap.estado.ultimo == true)
            	retorno_atrasado = "Completado"
            else
            	retorno_atrasado = "Pendiente"
        	end
        	if ap.estado != nil
            	retorno_estado = ap.estado.nombre
        	end
        	if ap.fechaVencimiento != nil
            	retorno_fvenc = ap.fechaVencimiento.strftime('%d-%m-%y')
        	end
        	if ap.historiales.exists?
            	retorno_fultact = "#{Historial.where(actividad_proyecto_id: ap.id).last.fechaHora.strftime('%d-%m-%y   %H:%M')}"
        	end
			[@proyecto.etapa.nombre, ap.actividad.nombre, retorno_estado, retorno_fvenc, retorno_atrasado, retorno_fultact]
		end	
	end
end