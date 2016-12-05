Pais.create!([
  {nombre: "Argentina"},
  {nombre: "Paraguay"},
  {nombre: "Brasil"}
])
Provincia.create!([
  {nombre: "Misiones", pais_id: 1},
  {nombre: "Corrientes", pais_id: 1},
  {nombre: "Itapúa", pais_id: 2},
  {nombre: "Bahia", pais_id: 3}
])
Ciudad.create!([
  {nombre: "Posadas", provincia_id: 1, pais_id: 1},
  {nombre: "Apostoles", provincia_id: 1, pais_id: 1},
  {nombre: "Bella Vista", provincia_id: 2, pais_id: 1},
  {nombre: "Encarnación", provincia_id: 3, pais_id: 2}
])

Area.create!([
  {nombre: "Urbana"},
  {nombre: "Rural"}
])

TipoDocumento.create!([
  {nombre: "DNI"},
  {nombre: "Libreta de Enrolamiento"}
])

# Persona.create!([
#   {nombre: "Ana ", apellido: "Canteros", nroIdentificacion: "36063076", fechaNacimiento: "1991-11-05", calle: "176", nroDomicilio: "7141", piso: "", dpto: "", telefono: "4401604", email: "valeriianaa@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1}
# ])

# Empleado.create!([
#   {nombre: "Ana", apellido: "Canteros", nroIdentificacion: "36063076", fechaNacimiento: "1991-11-05", calle: "176", nroDomicilio: "7141", piso: "", dpto: "", telefono: "4401604", email: "valeriianaa@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1}
# ])


# MiembroEquipo.create!([
#   {nombre: "Daniela", apellido: "Schneider", nroIdentificacion: "33976521", fechaNacimiento: "1987-12-19", calle: "Av. Sarmiento", nroDomicilio: "8076", piso: "3", dpto: "7", telefono: "426924", email: "danischneider@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 2}
# ])

Departamento.create!([
  {nombre: "Finanzas"},
  {nombre: "Recursos Humanos"},
  {nombre: "Evaluación"},
  {nombre: "Logística"},
  {nombre: "Dirección"}
])

RolDeEmpleado.create!([
  {nombre: "Encargado de nómina", departamento_id: 1},
  {nombre: "Encargado de recaudaciones e ingresos", departamento_id: 1},
  {nombre: "Jefe de Recursos Humanos", departamento_id: 2},
  {nombre: "Jefe de mercadeo", departamento_id: 3},
  {nombre: "jefe de producción", departamento_id: 3},
  {nombre: "Investigación y desarrollo", departamento_id: 4},
  {nombre: "Capacitación - Mentoring", departamento_id: 4},
  {nombre: "Director General", departamento_id: 5}
])

Empleado.create!([
  {nombre: "Ana", apellido: "Canteros", nroIdentificacion: "36063076", fechaNacimiento: "1991-11-05", calle: "176", nroDomicilio: "7141", piso: "", dpto: "", telefono: "4401604", email: "valeriianaa@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 5, rol_de_empleado_id: 8, area_id: 1},
  {nombre: "Martina", apellido: "Quiñones", nroIdentificacion: "25147001", fechaNacimiento: "1974-05-06", calle: "Tereré", nroDomicilio: "7302", piso: "4", dpto: "B", telefono: "4355987", email: "martinaquinones@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 4, rol_de_empleado_id: 7, area_id: 1},
  {nombre: "Alba", apellido: "Perez", nroIdentificacion: "33880657", fechaNacimiento: "1986-10-17", calle: "Rivera", nroDomicilio: "6872", piso: "", dpto: "", telefono: "459885", email: "albaperez@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 3, rol_de_empleado_id: 4, area_id: 1},
  {nombre: "Victor", apellido: "Vazquez Valdez", nroIdentificacion: "33988307", fechaNacimiento: "1987-01-21", calle: "Tereré", nroDomicilio: "1187", piso: "", dpto: "", telefono: "4456980", email: "vvv@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 2, rol_de_empleado_id: 3, area_id: 1},
  {nombre: "Zoe", apellido: "Cyr", nroIdentificacion: "38187849", fechaNacimiento: "1995-06-08", calle: "Castilla", nroDomicilio: "8299", piso: "10", dpto: "15", telefono: "4444176", email: "zoecyr@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 1, rol_de_empleado_id: 2, area_id: 1}
])

MiembroEquipo.create!([
  {nombre: "Daniela", apellido: "Schneider", nroIdentificacion: "33976521", fechaNacimiento: "1987-12-19", calle: "Av. Sarmiento", nroDomicilio: "8076", piso: "3", dpto: "7", telefono: "426924", email: "danischneider@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 2, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Ines", apellido: "Osterhagen", nroIdentificacion: "29717765", fechaNacimiento: "1981-11-30", calle: "Belgrano", nroDomicilio: "4827", piso: "", dpto: "", telefono: "423722", email: "inesosterhagen@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Miguel", apellido: "Jablonski", nroIdentificacion: "34029649", fechaNacimiento: "1990-04-08", calle: "Los Llanos", nroDomicilio: "9026", piso: "9", dpto: "A", telefono: "423761", email: "migueljablonski@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Ernesto", apellido: "Barrios Rincón", nroIdentificacion: "29441422", fechaNacimiento: "1980-05-16", calle: "Av. Ucrania", nroDomicilio: "5206", piso: "", dpto: "", telefono: "423606", email: "ernestobr@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Evelyn", apellido: "Matos", nroIdentificacion: "20467791", fechaNacimiento: "1968-09-13", calle: "Paseo", nroDomicilio: "6118", piso: "", dpto: "", telefono: "423649", email: "evelynmatos@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1}
])

Etapa.create!([
  {nombre: "Pre incubacion", descripcion: "lalala", etapaAnterior: nil},
  {nombre: "Cuarta etapa", descripcion: "lalala", etapaAnterior: nil},
  {nombre: "Incubación", descripcion: "", etapaAnterior: 1},
  {nombre: "post incubacion", descripcion: "", etapaAnterior: 2}
])

Actividad.create!([
  {nombre: "Presentación de la idea", descripcion: "Nombre de la idea de emprendimiento y breve descripción", obligatorio: true, actividadesAntecedentes: [], etapa_id: 1},
  {nombre: "Análisis de factibilidad", descripcion: "Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo", obligatorio: true, actividadesAntecedentes: ["1"], etapa_id: 1},
  {nombre: "Evaluación", descripcion: "Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa", obligatorio: true, actividadesAntecedentes: ["1", "2"], etapa_id: 1},
  {nombre: "Definicion del producto", descripcion: "El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar", obligatorio: true, actividadesAntecedentes: nil, etapa_id: 2},
  {nombre: "Misión, Visión, Objetivos", descripcion: "Definicion de misión, visión, y objetivos generales y particulares del emprendimiento", obligatorio: false, actividadesAntecedentes: ["4"], etapa_id: 2},
  {nombre: "Mercado - Clientes principales", descripcion: "Definicion del nicho de mercado", obligatorio: true, actividadesAntecedentes: ["4"], etapa_id: 2},
  {nombre: "Búsqueda de financiamiento", descripcion: "Ponerse en contacto con personas que ayudarán al crecimiento del proyecto", obligatorio: false, actividadesAntecedentes: nil, etapa_id: 2},
  {nombre: "Asistencia a Conferencias", descripcion: "Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa", obligatorio: true, actividadesAntecedentes: nil, etapa_id: 2},
  {nombre: "Seguimiento", descripcion: "Empresa en etapa de post incubacion", obligatorio: true, actividadesAntecedentes: nil, etapa_id: 3},
  {nombre: "Desarrollo de evento o conferencia", descripcion: "Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación", obligatorio: true, actividadesAntecedentes: ["9", "2", "3"], etapa_id: 3},
  {nombre: "Financiamiento a un nuevo proyecto", descripcion: "Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento", obligatorio: true, actividadesAntecedentes: ["1", "2", "3"], etapa_id: 3}
])

Proyecto.create!([
  {nombre: "proyecto 1", descripcion: "Soy el proyecto 1", calle: "176", nroDomicilio: "7141", piso: "", dpto: "", telefono: "", email: "", pagWeb: "", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1},
  {nombre: "Trip -Drop, Turismo Solidario", descripcion: "Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.", calle: "Av. San Martin", nroDomicilio: "3141", piso: "", dpto: "", telefono: "3758 423099", email: "tripdrop@gmail.com", pagWeb: "tripdrop.com", pais_id: 1, provincia_id: 1, ciudad_id: 2, etapa_id: 1, area_id: 1}
])

PersonaProyecto.create!([
  {proyecto_id: 1, persona_id: 6},
  {proyecto_id: 1, persona_id: 7},
  {proyecto_id: 1, persona_id: 2},
  {proyecto_id: 2, persona_id: 2},
  {proyecto_id: 2, persona_id: 8},
  {proyecto_id: 2, persona_id: 9}
])

##ATENCION!!! fecha de vencimiento es nil, y esta bien cuando se crea la act proy. pero despues el usuario actualiza y el valor se debe reflejar!!!
ActividadProyecto.create!([
  {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 3, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 3, estado_id: nil}
])


Estado.create!([
  {nombre: "To do", ultimo: false, previous: nil},
  {nombre: "Doing", ultimo: false, previous: 1},
  {nombre: "Done", ultimo: true, previous: 2}
])

ConceptoDePago.create!([
  {nombre: "Cuota de Septiembre", descripcion: "corresponde al año 2016", monto: 200.0, fechaVencimiento: "2016-09-10 00:00:00", plazoRecordatorio: "2016-08-31 00:00:00"},
  {nombre: "Cuota de Octubre", descripcion: "año 2016", monto: 200.0, fechaVencimiento: "2016-10-10 00:00:00", plazoRecordatorio: "2016-09-25 00:00:00"},
  {nombre: "Cuota de Noviembre", descripcion: "año 2016", monto: 200.0, fechaVencimiento: "2016-11-10 00:00:00", plazoRecordatorio: "2016-10-21 00:00:00"},
  {nombre: "Cuota de Diciembre", descripcion: "año 2016", monto: 200.0, fechaVencimiento: "2016-12-10 00:00:00", plazoRecordatorio: "2016-11-26 00:00:00"}
])

#--------------------------------------------------------


# Actividad.create!([
#   {nombre: "Presentación de la idea", descripcion: "Nombre de la idea de emprendimiento y breve descripción", obligatorio: true, actividadesAntecedentes: [], etapa_id: 1},
#   {nombre: "Análisis de factibilidad", descripcion: "Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo", obligatorio: true, actividadesAntecedentes: ["1"], etapa_id: 1},
#   {nombre: "Evaluación", descripcion: "Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa", obligatorio: true, actividadesAntecedentes: ["1", "2"], etapa_id: 1},
#   {nombre: "Definicion del producto", descripcion: "El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar", obligatorio: true, actividadesAntecedentes: nil, etapa_id: 2},
#   {nombre: "Misión, Visión, Objetivos", descripcion: "Definicion de misión, visión, y objetivos generales y particulares del emprendimiento", obligatorio: false, actividadesAntecedentes: ["4"], etapa_id: 2},
#   {nombre: "Mercado - Clientes principales", descripcion: "Definicion del nicho de mercado", obligatorio: true, actividadesAntecedentes: ["4"], etapa_id: 2},
#   {nombre: "Búsqueda de financiamiento", descripcion: "Ponerse en contacto con personas que ayudarán al crecimiento del proyecto", obligatorio: false, actividadesAntecedentes: nil, etapa_id: 2},
#   {nombre: "Asistencia a Conferencias", descripcion: "Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa", obligatorio: true, actividadesAntecedentes: nil, etapa_id: 2},
#   {nombre: "Seguimiento", descripcion: "Empresa en etapa de post incubacion", obligatorio: true, actividadesAntecedentes: nil, etapa_id: 3},
#   {nombre: "Desarrollo de evento o conferencia", descripcion: "Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación", obligatorio: true, actividadesAntecedentes: ["9", "2", "3"], etapa_id: 3},
#   {nombre: "Financiamiento a un nuevo proyecto", descripcion: "Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento", obligatorio: true, actividadesAntecedentes: ["1", "2", "3"], etapa_id: 3}
# ])
# ActividadProyecto.create!([
#   {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 1, estado_id: nil},
#   {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 2, estado_id: nil},
#   {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 3, estado_id: nil},
#   {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 2, estado_id: nil},
#   {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 3, estado_id: 3}
# ])
# Area.create!([
#   {nombre: "Urbana"},
#   {nombre: "Rural"}
# ])
# Ciudad.create!([
#   {nombre: "Posadas", provincia_id: 1, pais_id: 1},
#   {nombre: "Apostoles", provincia_id: 1, pais_id: 1},
#   {nombre: "Bella Vista", provincia_id: 2, pais_id: 1},
#   {nombre: "Encarnación", provincia_id: 3, pais_id: 2}
# ])
# ConceptoDePago.create!([
#   {nombre: "Cuota de Septiembre", descripcion: "corresponde al año 2016", monto: 200.0, fechaVencimiento: "2016-09-10 00:00:00", plazoRecordatorio: "2016-08-31 00:00:00"},
#   {nombre: "Cuota de Octubre", descripcion: "año 2016", monto: 200.0, fechaVencimiento: "2016-10-10 00:00:00", plazoRecordatorio: "2016-09-25 00:00:00"},
#   {nombre: "Cuota de Noviembre", descripcion: "año 2016", monto: 200.0, fechaVencimiento: "2016-11-10 00:00:00", plazoRecordatorio: "2016-10-21 00:00:00"},
#   {nombre: "Cuota de Diciembre", descripcion: "año 2016", monto: 200.0, fechaVencimiento: "2016-12-10 00:00:00", plazoRecordatorio: "2016-11-26 00:00:00"}
# ])
# Persona.create!([
#   {nombre: "Ana", apellido: "Canteros", nroIdentificacion: "36063076", fechaNacimiento: "1991-11-05", calle: "176", nroDomicilio: "7141", piso: "", dpto: "", telefono: "4401604", email: "valeriianaa@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 5, area_id: 1, rol_de_empleado_id: 8},
#   {nombre: "Martina", apellido: "Quiñones", nroIdentificacion: "25147001", fechaNacimiento: "1974-05-06", calle: "Tereré", nroDomicilio: "7302", piso: "4", dpto: "B", telefono: "4355987", email: "martinaquinones@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 4, area_id: 1, rol_de_empleado_id: 7},
#   {nombre: "Alba", apellido: "Perez", nroIdentificacion: "33880657", fechaNacimiento: "1986-10-17", calle: "Rivera", nroDomicilio: "6872", piso: "", dpto: "", telefono: "459885", email: "albaperez@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 3, area_id: 1, rol_de_empleado_id: 4},
#   {nombre: "Victor", apellido: "Vazquez Valdez", nroIdentificacion: "33988307", fechaNacimiento: "1987-01-21", calle: "Tereré", nroDomicilio: "1187", piso: "", dpto: "", telefono: "4456980", email: "vvv@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 2, area_id: 1, rol_de_empleado_id: 3},
#   {nombre: "Zoe", apellido: "Cyr", nroIdentificacion: "38187849", fechaNacimiento: "1995-06-08", calle: "Castilla", nroDomicilio: "8299", piso: "10", dpto: "15", telefono: "4444176", email: "zoecyr@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 1, area_id: 1, rol_de_empleado_id: 2},
#   {nombre: "Daniela", apellido: "Schneider", nroIdentificacion: "33976521", fechaNacimiento: "1987-12-19", calle: "Av. Sarmiento", nroDomicilio: "8076", piso: "3", dpto: "7", telefono: "426924", email: "danischneider@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 2, departamento_id: nil, area_id: 1, rol_de_empleado_id: nil},
#   {nombre: "Ines", apellido: "Osterhagen", nroIdentificacion: "29717765", fechaNacimiento: "1981-11-30", calle: "Belgrano", nroDomicilio: "4827", piso: "", dpto: "", telefono: "423722", email: "inesosterhagen@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, area_id: 1, rol_de_empleado_id: nil},
#   {nombre: "Miguel", apellido: "Jablonski", nroIdentificacion: "34029649", fechaNacimiento: "1990-04-08", calle: "Los Llanos", nroDomicilio: "9026", piso: "9", dpto: "A", telefono: "423761", email: "migueljablonski@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, area_id: 1, rol_de_empleado_id: nil},
#   {nombre: "Ernesto", apellido: "Barrios Rincón", nroIdentificacion: "29441422", fechaNacimiento: "1980-05-16", calle: "Av. Ucrania", nroDomicilio: "5206", piso: "", dpto: "", telefono: "423606", email: "ernestobr@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, area_id: 1, rol_de_empleado_id: nil},
#   {nombre: "Evelyn", apellido: "Matos", nroIdentificacion: "20467791", fechaNacimiento: "1968-09-13", calle: "Paseo", nroDomicilio: "6118", piso: "", dpto: "", telefono: "423649", email: "evelynmatos@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, area_id: 1, rol_de_empleado_id: nil}
# ])
# CuotaPorCliente.create!([
#   {mensaje: nil, montoTotal: 192.0, montoAcreditado: 0.0, concepto_de_pago_id: 1, persona_proyecto_id: nil, proyecto_id: 2, interes_id: 1, descuento_id: 1},
#   {mensaje: nil, montoTotal: 240.0, montoAcreditado: 0.0, concepto_de_pago_id: 2, persona_proyecto_id: nil, proyecto_id: 2, interes_id: 1, descuento_id: nil},
#   {mensaje: nil, montoTotal: 180.0, montoAcreditado: 0.0, concepto_de_pago_id: 3, persona_proyecto_id: nil, proyecto_id: 2, interes_id: nil, descuento_id: 1}
# ])
# Departamento.create!([
#   {nombre: "Finanzas"},
#   {nombre: "Recursos Humanos"},
#   {nombre: "Evaluación"},
#   {nombre: "Logística"},
#   {nombre: "Dirección"}
# ])
# Descuento.create!([
#   {nombre: "Descuento 10%", descripcion: "-", porcentaje: 10.0}
# ])
# Estado.create!([
#   {nombre: "To do", ultimo: false, previous: nil, color: nil},
#   {nombre: "Doing", ultimo: false, previous: 1, color: nil},
#   {nombre: "Done", ultimo: true, previous: 2, color: nil}
# ])
# Etapa.create!([
#   {nombre: "Pre incubacion", descripcion: "lalala", etapaAnterior: nil},
#   {nombre: "Cuarta etapa", descripcion: "lalala", etapaAnterior: nil},
#   {nombre: "Incubación", descripcion: "", etapaAnterior: 1},
#   {nombre: "post incubacion", descripcion: "", etapaAnterior: 2}
# ])
# Historial.create!([
#   {fechaHora: "2016-11-23 08:01:00", actividad_proyecto_id: 4, estado_id: 1, proyecto_id: 2},
#   {fechaHora: "2016-11-23 09:24:00", actividad_proyecto_id: 5, estado_id: 3, proyecto_id: 2},
#   {fechaHora: "2016-11-23 08:01:00", actividad_proyecto_id: 4, estado_id: 3, proyecto_id: 2},
#   {fechaHora: "2016-11-23 09:46:00", actividad_proyecto_id: 6, estado_id: 3, proyecto_id: 2}
# ])
# Interes.create!([
#   {nombre: "Interes 20%", descripcion: "-", porcentaje: 20.0}
# ])
# Pais.create!([
#   {nombre: "Argentina"},
#   {nombre: "Paraguay"},
#   {nombre: "Brasil"}
# ])
# PersonaProyecto.create!([
#   {proyecto_id: 1, persona_id: 6},
#   {proyecto_id: 1, persona_id: 7},
#   {proyecto_id: 2, persona_id: 8},
#   {proyecto_id: 2, persona_id: 9}
# ])
# Provincia.create!([
#   {nombre: "Misiones", pais_id: 1},
#   {nombre: "Corrientes", pais_id: 1},
#   {nombre: "Itapúa", pais_id: 2},
#   {nombre: "Bahia", pais_id: 3}
# ])
# Proyecto.create!([
#   {nombre: "proyecto 1", descripcion: "Soy el proyecto 1", calle: "176", nroDomicilio: "7141", piso: "", dpto: "", telefono: "", email: "", pagWeb: "", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1},
#   {nombre: "Trip -Drop, Turismo Solidario", descripcion: "Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.", calle: "Av. San Martin", nroDomicilio: "3141", piso: "", dpto: "", telefono: "3758 423099", email: "tripdrop@gmail.com", pagWeb: "tripdrop.com", pais_id: 1, provincia_id: 1, ciudad_id: 2, etapa_id: 1, area_id: 1}
# ])
# RolDeEmpleado.create!([
#   {nombre: "Encargado de nómina", departamento_id: 1},
#   {nombre: "Encargado de recaudaciones e ingresos", departamento_id: 1},
#   {nombre: "Jefe de Recursos Humanos", departamento_id: 2},
#   {nombre: "Jefe de mercadeo", departamento_id: 3},
#   {nombre: "jefe de producción", departamento_id: 3},
#   {nombre: "Investigación y desarrollo", departamento_id: 4},
#   {nombre: "Capacitación - Mentoring", departamento_id: 4},
#   {nombre: "Director General", departamento_id: 5}
# ])Acti
# TipoDocumento.create!([
#   {nombre: "DNI"},
#   {nombre: "Libreta de Enrolamiento"}
# ])
# Empleado.create!([
#   {nombre: "Ana", apellido: "Canteros", nroIdentificacion: "36063076", fechaNacimiento: "1991-11-05", calle: "176", nroDomicilio: "7141", piso: "", dpto: "", telefono: "4401604", email: "valeriianaa@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 5, area_id: 1, rol_de_empleado_id: 8},
#   {nombre: "Martina", apellido: "Quiñones", nroIdentificacion: "25147001", fechaNacimiento: "1974-05-06", calle: "Tereré", nroDomicilio: "7302", piso: "4", dpto: "B", telefono: "4355987", email: "martinaquinones@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 4, area_id: 1, rol_de_empleado_id: 7},
#   {nombre: "Alba", apellido: "Perez", nroIdentificacion: "33880657", fechaNacimiento: "1986-10-17", calle: "Rivera", nroDomicilio: "6872", piso: "", dpto: "", telefono: "459885", email: "albaperez@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 3, area_id: 1, rol_de_empleado_id: 4},
#   {nombre: "Victor", apellido: "Vazquez Valdez", nroIdentificacion: "33988307", fechaNacimiento: "1987-01-21", calle: "Tereré", nroDomicilio: "1187", piso: "", dpto: "", telefono: "4456980", email: "vvv@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 2, area_id: 1, rol_de_empleado_id: 3},
#   {nombre: "Zoe", apellido: "Cyr", nroIdentificacion: "38187849", fechaNacimiento: "1995-06-08", calle: "Castilla", nroDomicilio: "8299", piso: "10", dpto: "15", telefono: "4444176", email: "zoecyr@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 1, area_id: 1, rol_de_empleado_id: 2}
# ])
# MiembroEquipo.create!([
#   {nombre: "Daniela", apellido: "Schneider", nroIdentificacion: "33976521", fechaNacimiento: "1987-12-19", calle: "Av. Sarmiento", nroDomicilio: "8076", piso: "3", dpto: "7", telefono: "426924", email: "danischneider@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 2, departamento_id: nil, area_id: 1, rol_de_empleado_id: nil},
#   {nombre: "Ines", apellido: "Osterhagen", nroIdentificacion: "29717765", fechaNacimiento: "1981-11-30", calle: "Belgrano", nroDomicilio: "4827", piso: "", dpto: "", telefono: "423722", email: "inesosterhagen@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, area_id: 1, rol_de_empleado_id: nil},
#   {nombre: "Miguel", apellido: "Jablonski", nroIdentificacion: "34029649", fechaNacimiento: "1990-04-08", calle: "Los Llanos", nroDomicilio: "9026", piso: "9", dpto: "A", telefono: "423761", email: "migueljablonski@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, area_id: 1, rol_de_empleado_id: nil},
#   {nombre: "Ernesto", apellido: "Barrios Rincón", nroIdentificacion: "29441422", fechaNacimiento: "1980-05-16", calle: "Av. Ucrania", nroDomicilio: "5206", piso: "", dpto: "", telefono: "423606", email: "ernestobr@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, area_id: 1, rol_de_empleado_id: nil},
#   {nombre: "Evelyn", apellido: "Matos", nroIdentificacion: "20467791", fechaNacimiento: "1968-09-13", calle: "Paseo", nroDomicilio: "6118", piso: "", dpto: "", telefono: "423649", email: "evelynmatos@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, area_id: 1, rol_de_empleado_id: nil}
# ])
