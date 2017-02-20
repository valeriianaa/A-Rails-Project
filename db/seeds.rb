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
  {nombre: "Ana", apellido: "Canteros", nroIdentificacion: "36063076", fechaNacimiento: "1991-11-05", calle: "176", nroDomicilio: "7141", piso: "", dpto: "", telefono: "4401604", email: "valeriianaa@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 5, especialidad_de_contacto_id: nil, area_id: 1, rol_de_empleado_id: 8},
  {nombre: "Martina", apellido: "Quiñones", nroIdentificacion: "25147001", fechaNacimiento: "1974-05-06", calle: "Tereré", nroDomicilio: "7302", piso: "4", dpto: "B", telefono: "4355987", email: "martinaquinones@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 4, especialidad_de_contacto_id: nil, area_id: 1, rol_de_empleado_id: 7},
  {nombre: "Alba", apellido: "Perez", nroIdentificacion: "33880657", fechaNacimiento: "1986-10-17", calle: "Rivera", nroDomicilio: "6872", piso: "", dpto: "", telefono: "459885", email: "albaperez@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 3, especialidad_de_contacto_id: nil, area_id: 1, rol_de_empleado_id: 4},
  {nombre: "Victor", apellido: "Vazquez Valdez", nroIdentificacion: "33988307", fechaNacimiento: "1987-01-21", calle: "Tereré", nroDomicilio: "1187", piso: "", dpto: "", telefono: "4456980", email: "vvv@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 2, especialidad_de_contacto_id: nil, area_id: 1, rol_de_empleado_id: 3},
  {nombre: "Zoe", apellido: "Cyr", nroIdentificacion: "38187849", fechaNacimiento: "1995-06-08", calle: "Castilla", nroDomicilio: "8299", piso: "10", dpto: "15", telefono: "4444176", email: "zoecyr@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 1, especialidad_de_contacto_id: nil, area_id: 1, rol_de_empleado_id: 2},
  {nombre: "Luis", apellido: "Castro", nroIdentificacion: "22617493", fechaNacimiento: "1970-02-20", calle: "Av. Andalucia", nroDomicilio: "7415", piso: "12", dpto: "A", telefono: "4255987", email: "luiscastro@gmail.com", type: "Empleado", pais_id: 1, provincia_id: 1, ciudad_id: 1, tipo_documento_id: 1, departamento_id: 4, especialidad_de_contacto_id: nil, area_id: nil, rol_de_empleado_id: 7}
])

MiembroEquipo.create!([
  {nombre: "Daniela", apellido: "Schneider", nroIdentificacion: "33976521", fechaNacimiento: "1987-12-19", calle: "Av. Sarmiento", nroDomicilio: "8076", piso: "3", dpto: "7", telefono: "426924", email: "danischneider@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 2, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Ines", apellido: "Osterhagen", nroIdentificacion: "29717765", fechaNacimiento: "1981-11-30", calle: "Belgrano", nroDomicilio: "4827", piso: "", dpto: "", telefono: "423722", email: "inesosterhagen@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Miguel", apellido: "Jablonski", nroIdentificacion: "34029649", fechaNacimiento: "1990-04-08", calle: "Los Llanos", nroDomicilio: "9026", piso: "9", dpto: "A", telefono: "423761", email: "migueljablonski@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Ernesto", apellido: "Barrios Rincón", nroIdentificacion: "29441422", fechaNacimiento: "1980-05-16", calle: "Av. Ucrania", nroDomicilio: "5206", piso: "", dpto: "", telefono: "423606", email: "ernestobr@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Evelyn", apellido: "Matos", nroIdentificacion: "20467791", fechaNacimiento: "1968-09-13", calle: "Paseo", nroDomicilio: "6118", piso: "", dpto: "", telefono: "423649", email: "evelynmatos@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1}
])

Etapa.create!([
  {nombre: "Pre incubacion", descripcion: "-", etapaAnterior: nil},
  {nombre: "Incubación", descripcion: "-", etapaAnterior: 1},
  {nombre: "post incubacion", descripcion: "-", etapaAnterior: 2},
  {nombre: "Cuarta etapa", descripcion: "-", etapaAnterior: nil}
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
  {codigo:"PR-001", nombre: "proyecto 1", descripcion: "Soy el proyecto 1", calle: "176", nroDomicilio: "7141", piso: "", dpto: "", telefono: "", email: "", pagWeb: "", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1},
  {codigo:"PR-002", nombre: "Trip -Drop, Turismo Solidario", descripcion: "Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.", calle: "Av. San Martin", nroDomicilio: "3141", piso: "", dpto: "", telefono: "3758 423099", email: "tripdrop@gmail.com", pagWeb: "tripdrop.com", pais_id: 1, provincia_id: 1, ciudad_id: 2, etapa_id: 1, area_id: 1},
  {codigo:"PR-003", nombre: "Idea Sitios ", descripcion: "Diseño de páginas web", calle: "Mariano Moreno", nroDomicilio: "8787", piso: "", dpto: "", telefono: "4465711", email: "ideassitios@gmail.com", pagWeb: "ideassitios.com", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1}
])

PersonaProyecto.create!([
  {proyecto_id: 1, persona_id: 6},
  {proyecto_id: 1, persona_id: 7},
  {proyecto_id: 1, persona_id: 2},
  {proyecto_id: 2, persona_id: 2},
  {proyecto_id: 2, persona_id: 8},
  {proyecto_id: 2, persona_id: 9},
  {proyecto_id: 3, persona_id: 7},
  {proyecto_id: 3, persona_id: 10},
  {proyecto_id: 3, persona_id: 11}
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

Descuento.create!([
   {nombre: "Descuento 10%", descripcion: "-", porcentaje: 10.0}
])

Interes.create!([
  {nombre: "Interes 20%", descripcion: "-", porcentaje: 20.0}
])

TipoDePago.create!([
  {nombre: "Efectivo"}
])

ConceptoDePago.create!([
  {nombre: "Cuota de Enero", descripcion: "Enero 2017", monto: 200.0},
  {nombre: "Cuota de Febrero", descripcion: "Febrero 2017", monto: 200.0},
  {nombre: "Cuota de Marzo", descripcion: "Marzo 2017", monto: 200.0},
  {nombre: "Cuota de Abril", descripcion: "Abril 2017", monto: 200.0},
  {nombre: "Cuota de Mayo", descripcion: "Mayo 2017", monto: 200.0},
  {nombre: "Cuota de Junio", descripcion: "Junio 2017", monto: 200.0},
  {nombre: "Cuota de Julio", descripcion: "Julio 2017", monto: 200.0},
  {nombre: "Cuota de Agosto", descripcion: "Agosto 2017", monto: 200.0},
  {nombre: "Cuota de Septiembre", descripcion: "Septiembre 2017", monto: 200.0},
  {nombre: "Cuota de Octubre", descripcion: "Octubre 2017", monto: 200.0},
  {nombre: "Cuota de Noviembre", descripcion: "Noviembre 2017", monto: 200.0},
  {nombre: "Cuota de Diciembre", descripcion: "Diciembre 2017", monto: 200.0}
])

Vencimiento.create!([
  {fecha: "2017-01-10", concepto_de_pago_id: 1, interes_id: 1},
  {fecha: "2017-01-20", concepto_de_pago_id: 1, interes_id: 1},
  {fecha: "2017-02-10", concepto_de_pago_id: 2, interes_id: 1},
  {fecha: "2017-02-20", concepto_de_pago_id: 2, interes_id: 1},
  {fecha: "2017-03-10", concepto_de_pago_id: 3, interes_id: 1},
  {fecha: "2017-03-20", concepto_de_pago_id: 3, interes_id: 1},
  {fecha: "2017-04-10", concepto_de_pago_id: 4, interes_id: 1},
  {fecha: "2017-04-20", concepto_de_pago_id: 4, interes_id: 1},
  {fecha: "2017-05-10", concepto_de_pago_id: 5, interes_id: 1},
  {fecha: "2017-05-20", concepto_de_pago_id: 5, interes_id: 1},
  {fecha: "2017-06-10", concepto_de_pago_id: 6, interes_id: 1},
  {fecha: "2017-06-20", concepto_de_pago_id: 6, interes_id: 1},
  {fecha: "2017-07-10", concepto_de_pago_id: 7, interes_id: 1},
  {fecha: "2017-07-10", concepto_de_pago_id: 7, interes_id: 1},
  {fecha: "2017-08-10", concepto_de_pago_id: 8, interes_id: 1},
  {fecha: "2017-08-10", concepto_de_pago_id: 8, interes_id: 1},
  {fecha: "2017-09-10", concepto_de_pago_id: 9, interes_id: 1},
  {fecha: "2017-09-20", concepto_de_pago_id: 9, interes_id: 1},
  {fecha: "2017-10-10", concepto_de_pago_id: 10, interes_id: 1},
  {fecha: "2017-10-20", concepto_de_pago_id: 10, interes_id: 1},
  {fecha: "2017-11-10", concepto_de_pago_id: 11, interes_id: 1},
  {fecha: "2017-11-20", concepto_de_pago_id: 11, interes_id: 1},
  {fecha: "2017-12-10", concepto_de_pago_id: 12, interes_id: 1},
  {fecha: "2017-12-10", concepto_de_pago_id: 12, interes_id: 1}
])


Contrato.create!([
  {fecha_inicio: "2017-02-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 6, proyecto_id: 1},
  {fecha_inicio: "2017-02-01", fecha_fin: "2017-05-31", persona_proyecto_id: nil, persona_id: 2, proyecto_id: 2}
])

Cuenta.create!([
  {saldo: 0.0, proyecto_id: 1},
  {saldo: 0.0, proyecto_id: 2}
])

CuotaPorCliente.create!([
  {montoTotal: "200.0", estado: false, concepto_de_pago_id: 2, proyecto_id: 1, contrato_id: 1, pago_id: nil},
  {montoTotal: "200.0", estado: false, concepto_de_pago_id: 3, proyecto_id: 1, contrato_id: 1, pago_id: nil},
  {montoTotal: "200.0", estado: false, concepto_de_pago_id: 4, proyecto_id: 1, contrato_id: 1, pago_id: nil},
  {montoTotal: "200.0", estado: false, concepto_de_pago_id: 2, proyecto_id: 2, contrato_id: 2, pago_id: nil},
  {montoTotal: "200.0", estado: false, concepto_de_pago_id: 3, proyecto_id: 2, contrato_id: 2, pago_id: nil},
  {montoTotal: "200.0", estado: false, concepto_de_pago_id: 4, proyecto_id: 2, contrato_id: 2, pago_id: nil},
  {montoTotal: "200.0", estado: false, concepto_de_pago_id: 5, proyecto_id: 2, contrato_id: 2, pago_id: nil}
])

Accion.create!([
  {nombre: "Crear", key_name: "create"},
  {nombre: "Eliminar", key_name: "destroy"},
  {nombre: "Ver", key_name: "show"},
  {nombre: "Restringir acciones de acuerdo al tipo de persona", key_name: "by_persona_type"},
  {nombre: "Index", key_name: "index"},
  {nombre: "Editar", key_name: "update"},
  {nombre: "Estadisticas", key_name: "estadistica"}
])

Modelo.create!([
  {nombre: "Actividad"},
  {nombre: "Area"},
  {nombre: "Ciudad"},
  {nombre: "ConceptoDePago"},
  {nombre: "Contacto"},
  {nombre: "Contrato"},
  {nombre: "Cuenta"},
  {nombre: "Departamento"},
  {nombre: "Descuento"},
  {nombre: "Empleado"},
  {nombre: "EspecialidadDeContacto"},
  {nombre: "Estado"},
  {nombre: "Etapa"},
  {nombre: "Evento"},
  {nombre: "EventoProyecto"},
  {nombre: "MiembroEquipo"},
  {nombre: "Pago"},
  {nombre: "Pais"},
  {nombre: "Provincia"},
  {nombre: "Proyecto"},
  {nombre: "Rol"},
  {nombre: "RolDeEmpleado"},
  {nombre: "TipoDocumento"},
  {nombre: "TipoDePago"},
  {nombre: "User"},
  {nombre: "ActividadProyecto"},
  {nombre: "CuotaPorCliente"}
])

Permiso.create!([
  {accion_id: 1, modelo_id: 1},
  {accion_id: 2, modelo_id: 1},
  {accion_id: 3, modelo_id: 1},
  {accion_id: 4, modelo_id: 1},
  {accion_id: 1, modelo_id: 2},
  {accion_id: 2, modelo_id: 2},
  {accion_id: 3, modelo_id: 2},
  {accion_id: 4, modelo_id: 2},
  {accion_id: 1, modelo_id: 3},
  {accion_id: 2, modelo_id: 3},
  {accion_id: 3, modelo_id: 3},
  {accion_id: 4, modelo_id: 3},
  {accion_id: 1, modelo_id: 4},
  {accion_id: 2, modelo_id: 4},
  {accion_id: 3, modelo_id: 4},
  {accion_id: 4, modelo_id: 4},
  {accion_id: 1, modelo_id: 5},
  {accion_id: 2, modelo_id: 5},
  {accion_id: 3, modelo_id: 5},
  {accion_id: 4, modelo_id: 5},
  {accion_id: 1, modelo_id: 6},
  {accion_id: 2, modelo_id: 6},
  {accion_id: 3, modelo_id: 6},
  {accion_id: 4, modelo_id: 6},
  {accion_id: 1, modelo_id: 7},
  {accion_id: 2, modelo_id: 7},
  {accion_id: 3, modelo_id: 7},
  {accion_id: 4, modelo_id: 7},
  {accion_id: 1, modelo_id: 8},
  {accion_id: 2, modelo_id: 8},
  {accion_id: 3, modelo_id: 8},
  {accion_id: 4, modelo_id: 8},
  {accion_id: 1, modelo_id: 9},
  {accion_id: 2, modelo_id: 9},
  {accion_id: 3, modelo_id: 9},
  {accion_id: 4, modelo_id: 9},
  {accion_id: 1, modelo_id: 10},
  {accion_id: 2, modelo_id: 10},
  {accion_id: 3, modelo_id: 10},
  {accion_id: 4, modelo_id: 10},
  {accion_id: 1, modelo_id: 11},
  {accion_id: 2, modelo_id: 11},
  {accion_id: 3, modelo_id: 11},
  {accion_id: 4, modelo_id: 11},
  {accion_id: 1, modelo_id: 12},
  {accion_id: 2, modelo_id: 12},
  {accion_id: 3, modelo_id: 12},
  {accion_id: 4, modelo_id: 12},
  {accion_id: 1, modelo_id: 13},
  {accion_id: 2, modelo_id: 13},
  {accion_id: 3, modelo_id: 13},
  {accion_id: 4, modelo_id: 13},
  {accion_id: 1, modelo_id: 14},
  {accion_id: 2, modelo_id: 14},
  {accion_id: 3, modelo_id: 14},
  {accion_id: 4, modelo_id: 14},
  {accion_id: 1, modelo_id: 15},
  {accion_id: 2, modelo_id: 15},
  {accion_id: 3, modelo_id: 15},
  {accion_id: 4, modelo_id: 15},
  {accion_id: 1, modelo_id: 16},
  {accion_id: 2, modelo_id: 16},
  {accion_id: 3, modelo_id: 16},
  {accion_id: 4, modelo_id: 16},
  {accion_id: 1, modelo_id: 17},
  {accion_id: 2, modelo_id: 17},
  {accion_id: 3, modelo_id: 17},
  {accion_id: 4, modelo_id: 17},
  {accion_id: 1, modelo_id: 18},
  {accion_id: 2, modelo_id: 18},
  {accion_id: 3, modelo_id: 18},
  {accion_id: 4, modelo_id: 18},
  {accion_id: 1, modelo_id: 19},
  {accion_id: 2, modelo_id: 19},
  {accion_id: 3, modelo_id: 19},
  {accion_id: 4, modelo_id: 19},
  {accion_id: 1, modelo_id: 20},
  {accion_id: 2, modelo_id: 20},
  {accion_id: 3, modelo_id: 20},
  {accion_id: 4, modelo_id: 20},
  {accion_id: 1, modelo_id: 21},
  {accion_id: 2, modelo_id: 21},
  {accion_id: 3, modelo_id: 21},
  {accion_id: 4, modelo_id: 21},
  {accion_id: 1, modelo_id: 22},
  {accion_id: 2, modelo_id: 22},
  {accion_id: 3, modelo_id: 22},
  {accion_id: 4, modelo_id: 22},
  {accion_id: 1, modelo_id: 23},
  {accion_id: 2, modelo_id: 23},
  {accion_id: 3, modelo_id: 23},
  {accion_id: 4, modelo_id: 23},
  {accion_id: 1, modelo_id: 24},
  {accion_id: 2, modelo_id: 24},
  {accion_id: 3, modelo_id: 24},
  {accion_id: 4, modelo_id: 24},
  {accion_id: 1, modelo_id: 25},
  {accion_id: 2, modelo_id: 25},
  {accion_id: 3, modelo_id: 25},
  {accion_id: 4, modelo_id: 25},
  {accion_id: 5, modelo_id: 20},
  {accion_id: 6, modelo_id: 1},
  {accion_id: 6, modelo_id: 2},
  {accion_id: 6, modelo_id: 3},
  {accion_id: 6, modelo_id: 4},
  {accion_id: 6, modelo_id: 5},
  {accion_id: 6, modelo_id: 6},
  {accion_id: 6, modelo_id: 7},
  {accion_id: 6, modelo_id: 8},
  {accion_id: 6, modelo_id: 9},
  {accion_id: 6, modelo_id: 10},
  {accion_id: 6, modelo_id: 11},
  {accion_id: 6, modelo_id: 12},
  {accion_id: 6, modelo_id: 13},
  {accion_id: 6, modelo_id: 14},
  {accion_id: 6, modelo_id: 15},
  {accion_id: 6, modelo_id: 16},
  {accion_id: 6, modelo_id: 17},
  {accion_id: 6, modelo_id: 18},
  {accion_id: 6, modelo_id: 19},
  {accion_id: 6, modelo_id: 20},
  {accion_id: 6, modelo_id: 21},
  {accion_id: 6, modelo_id: 22},
  {accion_id: 6, modelo_id: 23},
  {accion_id: 6, modelo_id: 24},
  {accion_id: 6, modelo_id: 25},
  {accion_id: 2, modelo_id: 26},
  {accion_id: 4, modelo_id: 26},
  {accion_id: 6, modelo_id: 26},
  {accion_id: 5, modelo_id: 17},
  {accion_id: 5, modelo_id: 14},
  {accion_id: 5, modelo_id: 6},
  {accion_id: 1, modelo_id: 27},
  {accion_id: 3, modelo_id: 27},
  {accion_id: 4, modelo_id: 27},
  {accion_id: 5, modelo_id: 27},
  {accion_id: 6, modelo_id: 27},
  {accion_id: 7, modelo_id: 20}
])

Rol.create!([
  {nombre: "admin_empleados"},
  {nombre: "super_admin"},
  {nombre: "Encargado de Proyectos (mentor)"},
  {nombre: "Miembro de Equipo"}
])

Rol::HABTM_Permisos.create!([
  {permiso_id: 77, rol_id: 3},
  {permiso_id: 78, rol_id: 3},
  {permiso_id: 79, rol_id: 3},
  {permiso_id: 80, rol_id: 3},
  {permiso_id: 101, rol_id: 3},
  {permiso_id: 80, rol_id: 4},
  {permiso_id: 101, rol_id: 4},
  {permiso_id: 121, rol_id: 3},
  {permiso_id: 37, rol_id: 1},
  {permiso_id: 38, rol_id: 1},
  {permiso_id: 39, rol_id: 1},
  {permiso_id: 40, rol_id: 1},
  {permiso_id: 111, rol_id: 1},
  {permiso_id: 77, rol_id: 1},
  {permiso_id: 78, rol_id: 1},
  {permiso_id: 79, rol_id: 1},
  {permiso_id: 80, rol_id: 1},
  {permiso_id: 101, rol_id: 1},
  {permiso_id: 121, rol_id: 1}
])

# Permiso::HABTM_Roles.create!([
#   {permiso_id: 77, rol_id: 3},
#   {permiso_id: 78, rol_id: 3},
#   {permiso_id: 79, rol_id: 3},
#   {permiso_id: 80, rol_id: 3},
#   {permiso_id: 101, rol_id: 3},
#   {permiso_id: 80, rol_id: 4},
#   {permiso_id: 101, rol_id: 4},
#   {permiso_id: 121, rol_id: 3},
#   {permiso_id: 37, rol_id: 1},
#   {permiso_id: 38, rol_id: 1},
#   {permiso_id: 39, rol_id: 1},
#   {permiso_id: 40, rol_id: 1},
#   {permiso_id: 111, rol_id: 1},
#   {permiso_id: 77, rol_id: 1},
#   {permiso_id: 78, rol_id: 1},
#   {permiso_id: 79, rol_id: 1},
#   {permiso_id: 80, rol_id: 1},
#   {permiso_id: 101, rol_id: 1},
#   {permiso_id: 121, rol_id: 1}
# ])

User.create!([
  {email: "valeriianaa@gmail.com", password: "12345678", encrypted_password: "$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2017-02-20 02:52:46", last_sign_in_at: "2017-02-20 02:33:53", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", persona_id: 1, rol_id: 2},
  {email: "luiscastro@gmail.com", password: "12345678", encrypted_password: "$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2017-02-20 02:59:21", last_sign_in_at: "2017-02-20 02:22:18", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", persona_id: 11, rol_id: 3},
  {email: "mq@gmail.com", password: "12345678", encrypted_password: "$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-02-20 03:07:00", last_sign_in_at: "2017-02-20 02:53:38", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", persona_id: 2, rol_id: 1}
])




#--------------------------------------------------------






# Modelo.create!([
#   {nombre: "Actividad"},
#   {nombre: "Area"},
#   {nombre: "Ciudad"},
#   {nombre: "ConceptoDePago"},
#   {nombre: "Contacto"},
#   {nombre: "Contrato"},
#   {nombre: "Cuenta"},
#   {nombre: "Departamento"},
#   {nombre: "Descuento"},
#   {nombre: "Empleado"},
#   {nombre: "EspecialidadDeContacto"},
#   {nombre: "Estado"},
#   {nombre: "Etapa"},
#   {nombre: "Evento"},
#   {nombre: "EventoProyecto"},
#   {nombre: "MiembroEquipo"},
#   {nombre: "Pago"},
#   {nombre: "Pais"},
#   {nombre: "Provincia"},
#   {nombre: "Proyecto"},
#   {nombre: "Rol"},
#   {nombre: "RolDeEmpleado"},
#   {nombre: "TipoDocumento"},
#   {nombre: "TipoDePago"},
#   {nombre: "User"},
#   {nombre: "ActividadProyecto"},
#   {nombre: "CuotaPorCliente"}
# ])

# Permiso.create!([
#   {accion_id: 1, modelo_id: 1},
#   {accion_id: 2, modelo_id: 1},
#   {accion_id: 3, modelo_id: 1},
#   {accion_id: 4, modelo_id: 1},
#   {accion_id: 1, modelo_id: 2},
#   {accion_id: 2, modelo_id: 2},
#   {accion_id: 3, modelo_id: 2},
#   {accion_id: 4, modelo_id: 2},
#   {accion_id: 1, modelo_id: 3},
#   {accion_id: 2, modelo_id: 3},
#   {accion_id: 3, modelo_id: 3},
#   {accion_id: 4, modelo_id: 3},
#   {accion_id: 1, modelo_id: 4},
#   {accion_id: 2, modelo_id: 4},
#   {accion_id: 3, modelo_id: 4},
#   {accion_id: 4, modelo_id: 4},
#   {accion_id: 1, modelo_id: 5},
#   {accion_id: 2, modelo_id: 5},
#   {accion_id: 3, modelo_id: 5},
#   {accion_id: 4, modelo_id: 5},
#   {accion_id: 1, modelo_id: 6},
#   {accion_id: 2, modelo_id: 6},
#   {accion_id: 3, modelo_id: 6},
#   {accion_id: 4, modelo_id: 6},
#   {accion_id: 1, modelo_id: 7},
#   {accion_id: 2, modelo_id: 7},
#   {accion_id: 3, modelo_id: 7},
#   {accion_id: 4, modelo_id: 7},
#   {accion_id: 1, modelo_id: 8},
#   {accion_id: 2, modelo_id: 8},
#   {accion_id: 3, modelo_id: 8},
#   {accion_id: 4, modelo_id: 8},
#   {accion_id: 1, modelo_id: 9},
#   {accion_id: 2, modelo_id: 9},
#   {accion_id: 3, modelo_id: 9},
#   {accion_id: 4, modelo_id: 9},
#   {accion_id: 1, modelo_id: 10},
#   {accion_id: 2, modelo_id: 10},
#   {accion_id: 3, modelo_id: 10},
#   {accion_id: 4, modelo_id: 10},
#   {accion_id: 1, modelo_id: 11},
#   {accion_id: 2, modelo_id: 11},
#   {accion_id: 3, modelo_id: 11},
#   {accion_id: 4, modelo_id: 11},
#   {accion_id: 1, modelo_id: 12},
#   {accion_id: 2, modelo_id: 12},
#   {accion_id: 3, modelo_id: 12},
#   {accion_id: 4, modelo_id: 12},
#   {accion_id: 1, modelo_id: 13},
#   {accion_id: 2, modelo_id: 13},
#   {accion_id: 3, modelo_id: 13},
#   {accion_id: 4, modelo_id: 13},
#   {accion_id: 1, modelo_id: 14},
#   {accion_id: 2, modelo_id: 14},
#   {accion_id: 3, modelo_id: 14},
#   {accion_id: 4, modelo_id: 14},
#   {accion_id: 1, modelo_id: 15},
#   {accion_id: 2, modelo_id: 15},
#   {accion_id: 3, modelo_id: 15},
#   {accion_id: 4, modelo_id: 15},
#   {accion_id: 1, modelo_id: 16},
#   {accion_id: 2, modelo_id: 16},
#   {accion_id: 3, modelo_id: 16},
#   {accion_id: 4, modelo_id: 16},
#   {accion_id: 1, modelo_id: 17},
#   {accion_id: 2, modelo_id: 17},
#   {accion_id: 3, modelo_id: 17},
#   {accion_id: 4, modelo_id: 17},
#   {accion_id: 1, modelo_id: 18},
#   {accion_id: 2, modelo_id: 18},
#   {accion_id: 3, modelo_id: 18},
#   {accion_id: 4, modelo_id: 18},
#   {accion_id: 1, modelo_id: 19},
#   {accion_id: 2, modelo_id: 19},
#   {accion_id: 3, modelo_id: 19},
#   {accion_id: 4, modelo_id: 19},
#   {accion_id: 1, modelo_id: 20},
#   {accion_id: 2, modelo_id: 20},
#   {accion_id: 3, modelo_id: 20},
#   {accion_id: 4, modelo_id: 20},
#   {accion_id: 1, modelo_id: 21},
#   {accion_id: 2, modelo_id: 21},
#   {accion_id: 3, modelo_id: 21},
#   {accion_id: 4, modelo_id: 21},
#   {accion_id: 1, modelo_id: 22},
#   {accion_id: 2, modelo_id: 22},
#   {accion_id: 3, modelo_id: 22},
#   {accion_id: 4, modelo_id: 22},
#   {accion_id: 1, modelo_id: 23},
#   {accion_id: 2, modelo_id: 23},
#   {accion_id: 3, modelo_id: 23},
#   {accion_id: 4, modelo_id: 23},
#   {accion_id: 1, modelo_id: 24},
#   {accion_id: 2, modelo_id: 24},
#   {accion_id: 3, modelo_id: 24},
#   {accion_id: 4, modelo_id: 24},
#   {accion_id: 1, modelo_id: 25},
#   {accion_id: 2, modelo_id: 25},
#   {accion_id: 3, modelo_id: 25},
#   {accion_id: 4, modelo_id: 25},
#   {accion_id: 5, modelo_id: 20},
#   {accion_id: 6, modelo_id: 1},
#   {accion_id: 6, modelo_id: 2},
#   {accion_id: 6, modelo_id: 3},
#   {accion_id: 6, modelo_id: 4},
#   {accion_id: 6, modelo_id: 5},
#   {accion_id: 6, modelo_id: 6},
#   {accion_id: 6, modelo_id: 7},
#   {accion_id: 6, modelo_id: 8},
#   {accion_id: 6, modelo_id: 9},
#   {accion_id: 6, modelo_id: 10},
#   {accion_id: 6, modelo_id: 11},
#   {accion_id: 6, modelo_id: 12},
#   {accion_id: 6, modelo_id: 13},
#   {accion_id: 6, modelo_id: 14},
#   {accion_id: 6, modelo_id: 15},
#   {accion_id: 6, modelo_id: 16},
#   {accion_id: 6, modelo_id: 17},
#   {accion_id: 6, modelo_id: 18},
#   {accion_id: 6, modelo_id: 19},
#   {accion_id: 6, modelo_id: 20},
#   {accion_id: 6, modelo_id: 21},
#   {accion_id: 6, modelo_id: 22},
#   {accion_id: 6, modelo_id: 23},
#   {accion_id: 6, modelo_id: 24},
#   {accion_id: 6, modelo_id: 25},
#   {accion_id: 2, modelo_id: 26},
#   {accion_id: 4, modelo_id: 26},
#   {accion_id: 6, modelo_id: 26},
#   {accion_id: 5, modelo_id: 17},
#   {accion_id: 5, modelo_id: 14},
#   {accion_id: 5, modelo_id: 6},
#   {accion_id: 1, modelo_id: 27},
#   {accion_id: 3, modelo_id: 27},
#   {accion_id: 4, modelo_id: 27},
#   {accion_id: 5, modelo_id: 27},
#   {accion_id: 6, modelo_id: 27},
#   {accion_id: 7, modelo_id: 20}
# ])



