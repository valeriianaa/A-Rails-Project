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
  {nombre: "Evelyn", apellido: "Matos", nroIdentificacion: "20467791", fechaNacimiento: "1968-09-13", calle: "Paseo", nroDomicilio: "6118", piso: "", dpto: "", telefono: "423649", email: "evelynmatos@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "David", apellido: "Molina", nroIdentificacion: "20315192", fechaNacimiento: "1987-05-16", calle: "Alemania", nroDomicilio: "4650", piso: "3", dpto: "7", telefono: "426924", email: "davidmolina@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 2, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Gabriela", apellido: "Garcia", nroIdentificacion: "40044940", fechaNacimiento: "1998-11-30", calle: "San Martín", nroDomicilio: "1716", piso: "", dpto: "", telefono: "423722", email: "gabigarcia@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Paola", apellido: "Serrano", nroIdentificacion: "24603447", fechaNacimiento: "1976-04-08", calle: "Colon", nroDomicilio: "2999", piso: "9", dpto: "A", telefono: "423761", email: "paolaserrano@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Benito", apellido: "Granados", nroIdentificacion: "36407952", fechaNacimiento: "1992-08-19", calle: "Floresta", nroDomicilio: "7744", piso: "", dpto: "", telefono: "423606", email: "benitogranados@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Mirtha", apellido: "Benavidez", nroIdentificacion: "26435388", fechaNacimiento: "1976-06-05", calle: "Río Negro", nroDomicilio: "1933", piso: "3", dpto: "7", telefono: "426924", email: "mirthabenavidez@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 2, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Hugo", apellido: "Ibarra", nroIdentificacion: "33428284", fechaNacimiento: "1989-09-04", calle: "Tigre", nroDomicilio: "4839", piso: "", dpto: "", telefono: "423722", email: "hugoibarra@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Thalia", apellido: "Ocampo", nroIdentificacion: "31424518", fechaNacimiento: "1986-07-03", calle: "Altamirano", nroDomicilio: "3662", piso: "9", dpto: "A", telefono: "423761", email: "thaliaocampo@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Jose", apellido: "Contreras", nroIdentificacion: "29767192", fechaNacimiento: "1981-04-09", calle: "3 de Febrero", nroDomicilio: "2691", piso: "", dpto: "", telefono: "423606", email: "josecontreras@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Mariangeles", apellido: "Elizondo", nroIdentificacion: "36376423", fechaNacimiento: "1992-11-05", calle: "Alcorta", nroDomicilio: "1214", piso: "3", dpto: "7", telefono: "426924", email: "marelizondo@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 2, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Leonardo", apellido: "Caballero Sosa", nroIdentificacion: "25370940", fechaNacimiento: "1975-07-23", calle: "Cte Izarduy", nroDomicilio: "9123", piso: "", dpto: "", telefono: "423722", email: "leocs@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Cintia", apellido: "Rios", nroIdentificacion: "40651702", fechaNacimiento: "1998-01-13", calle: "Río Negro", nroDomicilio: "1294", piso: "9", dpto: "A", telefono: "423761", email: "cintiarios@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Ana", apellido: "Heredia Maestas", nroIdentificacion: "27825263", fechaNacimiento: "1979-04-17", calle: "Constitución", nroDomicilio: "9934", piso: "", dpto: "", telefono: "423606", email: "anaherediamaestas@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Diana", apellido: "Arevalo", nroIdentificacion: "36181611", fechaNacimiento: "1992-06-19", calle: "Inglaterra", nroDomicilio: "1945", piso: "3", dpto: "7", telefono: "426924", email: "dianaarevalo@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 2, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Rosa", apellido: "Granados", nroIdentificacion: "30782514", fechaNacimiento: "1983-06-19", calle: "Floresta", nroDomicilio: "7744", piso: "", dpto: "", telefono: "423722", email: "rosagranados@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1},
  {nombre: "Abril", apellido: "Palacios", nroIdentificacion: "39525733", fechaNacimiento: "1995-04-08", calle: "Av Cervantes", nroDomicilio: "1844", piso: "9", dpto: "A", telefono: "423761", email: "abrilpalacios@gmail.com", type: "MiembroEquipo", pais_id: 1, provincia_id: 1, ciudad_id: 2, tipo_documento_id: 1, departamento_id: nil, rol_de_empleado_id: nil, area_id: 1}
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
  {codigo: "PR-001", nombre: "Pro Care, Jardines", descripcion: "Mantenimiento de jardines", calle: "176", nroDomicilio: "7141", piso: "", dpto: "", telefono: "4465711", email: "danischneider@gmail.com", pagWeb: "", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1},
  {codigo: "PR-002", nombre: "Trip -Drop, Turismo Solidario", descripcion: "Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.", calle: "Av. San Martin", nroDomicilio: "3141", piso: "", dpto: "", telefono: "3758 423099", email: "tripdrop@gmail.com", pagWeb: "tripdrop.com", pais_id: 1, provincia_id: 1, ciudad_id: 2, etapa_id: 1, area_id: 1},
  {codigo: "PR-003", nombre: "Idea Sitios ", descripcion: "Diseño de páginas web", calle: "Mariano Moreno", nroDomicilio: "8787", piso: "", dpto: "", telefono: "4465711", email: "ideassitios@gmail.com", pagWeb: "ideassitios.com", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1},
  {codigo: "PR-004", nombre: "Homie", descripcion: "Una plataforma online que permite al dueño de un inmueble determinar en 48 hs si una persona es confiable o no para alquilar dicho inmueble.", calle: "Alemania", nroDomicilio: "4650", piso: "", dpto: "", telefono: "154991812", email: "contacto@homie.com", pagWeb: "homie.com", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1},
  {codigo: "PR-005", nombre: "Fondeadora", descripcion: "Una plataforma de crowdfunding", calle: "Colon ", nroDomicilio: "700", piso: "1", dpto: "1", telefono: "4419768", email: "fondeadora@gmail.com", pagWeb: "fondeadora.com", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1},
  {codigo: "PR-006", nombre: "Obuu", descripcion: "Hemos desarrollado un método para optimizar el aprovisionamiento logístico mediante un software de preprocesado de datos con el que se pueden predecir las necesidades de stock de piezas de repuesto y herramientas en caso de avería.", calle: "Tigre ", nroDomicilio: "500", piso: "", dpto: "", telefono: "4596063", email: "obuu@gmail.com", pagWeb: "obuu.com", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1},
  {codigo: "PR-007", nombre: "Odilo", descripcion: "Una plataforma que permite a las bibliotecas de todo el país prestar contenido digital.", calle: "Miami", nroDomicilio: "790", piso: "12", dpto: "A", telefono: "459198", email: "odilo@gmail.com", pagWeb: "odilo.com", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 2},
  {codigo: "PR-008", nombre: "eHumanLife", descripcion: "Una plataforma que permite pedir a través de videoconferencia una segunda opinión médica a los mejores especialistas con traducción simultánea especializada", calle: "Alemania", nroDomicilio: "9123", piso: "", dpto: "", telefono: "154701859", email: "ehumanlife@gmail.com", pagWeb: "ehumanlife.com", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1},
  {codigo: "PR-009", nombre: "Endor nanotechnologies", descripcion: "Una startup de investigación médica que fabrica cosmética para regenerar la piel.", calle: "Inglaterra", nroDomicilio: "1234", piso: "", dpto: "", telefono: "424063", email: "endor@gmail.com", pagWeb: "endor.com", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1},
  {codigo: "PR-010", nombre: "MedBravo", descripcion: "Software en la nube que quiere convertir a todos los hospitales del mundo en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes con cancer.", calle: "Flores", nroDomicilio: "704", piso: "", dpto: "", telefono: "479842", email: "medbravo@gmail.com", pagWeb: "medbravo.com", pais_id: 1, provincia_id: 1, ciudad_id: 1, etapa_id: 1, area_id: 1}
])

PersonaProyecto.create!([
  {proyecto_id: 1, persona_id: 7},
  {proyecto_id: 1, persona_id: 2},
  {proyecto_id: 2, persona_id: 2},
  {proyecto_id: 2, persona_id: 8},
  {proyecto_id: 2, persona_id: 9},
  {proyecto_id: 3, persona_id: 6},
  {proyecto_id: 3, persona_id: 10},
  {proyecto_id: 3, persona_id: 11},
  {proyecto_id: 4, persona_id: 6},
  {proyecto_id: 4, persona_id: 12},
  {proyecto_id: 4, persona_id: 13},
  {proyecto_id: 5, persona_id: 2},
  {proyecto_id: 5, persona_id: 14},
  {proyecto_id: 5, persona_id: 15},
  {proyecto_id: 6, persona_id: 2},
  {proyecto_id: 6, persona_id: 16},
  {proyecto_id: 6, persona_id: 17},
  {proyecto_id: 6, persona_id: 19},
  {proyecto_id: 7, persona_id: 6},
  {proyecto_id: 7, persona_id: 18},
  {proyecto_id: 7, persona_id: 20},
  {proyecto_id: 8, persona_id: 2},
  {proyecto_id: 8, persona_id: 21},
  {proyecto_id: 9, persona_id: 6},
  {proyecto_id: 9, persona_id: 22},
  {proyecto_id: 9, persona_id: 23},
  {proyecto_id: 10, persona_id: 2},
  {proyecto_id: 10, persona_id: 24},
  {proyecto_id: 10, persona_id: 25},
  {proyecto_id: 10, persona_id: 26},
])

#Actividades Proyecto para PR-001 a PR-010 con historial y fecha de vencimiento en blanco
ActividadProyecto.create!([
  {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 3, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 3, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 3, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 3, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 3, actividad_id: 3, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 4, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 4, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 4, actividad_id: 3, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 5, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 5, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 5, actividad_id: 3, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 6, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 6, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 6, actividad_id: 3, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 7, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 7, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 7, actividad_id: 3, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 8, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 8, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 8, actividad_id: 3, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 9, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 9, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 9, actividad_id: 3, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 10, actividad_id: 1, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 10, actividad_id: 2, estado_id: nil},
  {fechaVencimiento: nil, proyecto_id: 10, actividad_id: 3, estado_id: nil}
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

User.create!([
  {email: "valeriianaa@gmail.com", password: "12345678", encrypted_password: "$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, persona_id: 1, rol_id: 2},
  {email: "luiscastro@gmail.com", password: "12345678", encrypted_password: "$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, persona_id: 6, rol_id: 3},
  {email: "mq@gmail.com", password: "12345678", encrypted_password: "$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, persona_id: 2, rol_id: 1}
])

Estado.create!([
  {nombre: "To do", ultimo: false, previous: nil},
  {nombre: "Doing", ultimo: false, previous: 1},
  {nombre: "Done", ultimo: true, previous: 2}
])

#Actividades Proyectos para proyectos PR-001 al PR-010
# ActividadProyecto.create!([
#   {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 2, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 1, actividad_id: 3, estado_id: 2},
#   {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 2, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 2, actividad_id: 3, estado_id: 2},
#   {fechaVencimiento: nil, proyecto_id: 3, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 3, actividad_id: 2, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 3, actividad_id: 3, estado_id: 2},
#   {fechaVencimiento: nil, proyecto_id: 4, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 4, actividad_id: 2, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 4, actividad_id: 3, estado_id: 2},
#   {fechaVencimiento: nil, proyecto_id: 5, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 5, actividad_id: 2, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 5, actividad_id: 3, estado_id: 2},
#   {fechaVencimiento: nil, proyecto_id: 6, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 6, actividad_id: 2, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 6, actividad_id: 3, estado_id: 2},
#   {fechaVencimiento: nil, proyecto_id: 7, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 7, actividad_id: 2, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 7, actividad_id: 3, estado_id: 2},
#   {fechaVencimiento: nil, proyecto_id: 8, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 8, actividad_id: 2, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 8, actividad_id: 3, estado_id: 2},
#   {fechaVencimiento: nil, proyecto_id: 9, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 9, actividad_id: 2, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 9, actividad_id: 3, estado_id: 2},
#   {fechaVencimiento: nil, proyecto_id: 10, actividad_id: 1, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 10, actividad_id: 2, estado_id: 3},
#   {fechaVencimiento: nil, proyecto_id: 10, actividad_id: 3, estado_id: 2}
# ])

#Historiales para proyectos PR-001 al PR-010
# Historial.create!([
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 1, estado_id: 1, proyecto_id: 1, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 2, estado_id: 1, proyecto_id: 1, user_id: 3},
#   {fechaHora: "2017-01-01 08:21:00", actividad_proyecto_id: 3, estado_id: 1, proyecto_id: 1, user_id: 3},
#   {fechaHora: "2017-01-01 08:22:00", actividad_proyecto_id: 1, estado_id: 2, proyecto_id: 1, user_id: 3},
#   {fechaHora: "2017-01-02 08:22:00", actividad_proyecto_id: 2, estado_id: 2, proyecto_id: 1, user_id: 3},
#   {fechaHora: "2017-01-08 08:23:00", actividad_proyecto_id: 3, estado_id: 2, proyecto_id: 1, user_id: 3},
#   {fechaHora: "2017-01-01 08:23:00", actividad_proyecto_id: 1, estado_id: 3, proyecto_id: 1, user_id: 3},
#   {fechaHora: "2017-01-06 08:24:00", actividad_proyecto_id: 2, estado_id: 3, proyecto_id: 1, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 4, estado_id: 1, proyecto_id: 2, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 5, estado_id: 1, proyecto_id: 2, user_id: 3},
#   {fechaHora: "2017-01-01 08:21:00", actividad_proyecto_id: 6, estado_id: 1, proyecto_id: 2, user_id: 3},
#   {fechaHora: "2017-01-01 08:22:00", actividad_proyecto_id: 4, estado_id: 2, proyecto_id: 2, user_id: 3},
#   {fechaHora: "2017-01-02 08:22:00", actividad_proyecto_id: 5, estado_id: 2, proyecto_id: 2, user_id: 3},
#   {fechaHora: "2017-01-08 08:23:00", actividad_proyecto_id: 6, estado_id: 2, proyecto_id: 2, user_id: 3},
#   {fechaHora: "2017-01-01 08:23:00", actividad_proyecto_id: 4, estado_id: 3, proyecto_id: 2, user_id: 3},
#   {fechaHora: "2017-01-06 08:24:00", actividad_proyecto_id: 5, estado_id: 3, proyecto_id: 2, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 7, estado_id: 1, proyecto_id: 3, user_id: 2},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 8, estado_id: 1, proyecto_id: 3, user_id: 2},
#   {fechaHora: "2017-01-01 08:21:00", actividad_proyecto_id: 9, estado_id: 1, proyecto_id: 3, user_id: 2},
#   {fechaHora: "2017-01-01 08:22:00", actividad_proyecto_id: 7, estado_id: 2, proyecto_id: 3, user_id: 2},
#   {fechaHora: "2017-01-02 08:22:00", actividad_proyecto_id: 8, estado_id: 2, proyecto_id: 3, user_id: 2},
#   {fechaHora: "2017-01-08 08:23:00", actividad_proyecto_id: 9, estado_id: 2, proyecto_id: 3, user_id: 2},
#   {fechaHora: "2017-01-01 08:23:00", actividad_proyecto_id: 7, estado_id: 3, proyecto_id: 3, user_id: 2},
#   {fechaHora: "2017-01-06 08:24:00", actividad_proyecto_id: 8, estado_id: 3, proyecto_id: 3, user_id: 2},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 10, estado_id: 1, proyecto_id: 4, user_id: 2},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 11, estado_id: 1, proyecto_id: 4, user_id: 2},
#   {fechaHora: "2017-01-01 08:21:00", actividad_proyecto_id: 12, estado_id: 1, proyecto_id: 4, user_id: 2},
#   {fechaHora: "2017-01-01 08:22:00", actividad_proyecto_id: 10, estado_id: 2, proyecto_id: 4, user_id: 2},
#   {fechaHora: "2017-01-02 08:22:00", actividad_proyecto_id: 11, estado_id: 2, proyecto_id: 4, user_id: 2},
#   {fechaHora: "2017-01-08 08:23:00", actividad_proyecto_id: 12, estado_id: 2, proyecto_id: 4, user_id: 2},
#   {fechaHora: "2017-01-01 08:23:00", actividad_proyecto_id: 10, estado_id: 3, proyecto_id: 4, user_id: 2},
#   {fechaHora: "2017-01-06 08:24:00", actividad_proyecto_id: 11, estado_id: 3, proyecto_id: 4, user_id: 2},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 13, estado_id: 1, proyecto_id: 5, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 14, estado_id: 1, proyecto_id: 5, user_id: 3},
#   {fechaHora: "2017-01-01 08:21:00", actividad_proyecto_id: 15, estado_id: 1, proyecto_id: 5, user_id: 3},
#   {fechaHora: "2017-01-01 08:22:00", actividad_proyecto_id: 13, estado_id: 2, proyecto_id: 5, user_id: 3},
#   {fechaHora: "2017-01-02 08:22:00", actividad_proyecto_id: 14, estado_id: 2, proyecto_id: 5, user_id: 3},
#   {fechaHora: "2017-01-08 08:23:00", actividad_proyecto_id: 15, estado_id: 2, proyecto_id: 5, user_id: 3},
#   {fechaHora: "2017-01-01 08:23:00", actividad_proyecto_id: 13, estado_id: 3, proyecto_id: 5, user_id: 3},
#   {fechaHora: "2017-01-06 08:24:00", actividad_proyecto_id: 14, estado_id: 3, proyecto_id: 5, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 16, estado_id: 1, proyecto_id: 6, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 17, estado_id: 1, proyecto_id: 6, user_id: 3},
#   {fechaHora: "2017-01-01 08:21:00", actividad_proyecto_id: 18, estado_id: 1, proyecto_id: 6, user_id: 3},
#   {fechaHora: "2017-01-01 08:22:00", actividad_proyecto_id: 16, estado_id: 2, proyecto_id: 6, user_id: 3},
#   {fechaHora: "2017-01-02 08:22:00", actividad_proyecto_id: 17, estado_id: 2, proyecto_id: 6, user_id: 3},
#   {fechaHora: "2017-01-08 08:23:00", actividad_proyecto_id: 18, estado_id: 2, proyecto_id: 6, user_id: 3},
#   {fechaHora: "2017-01-01 08:23:00", actividad_proyecto_id: 16, estado_id: 3, proyecto_id: 6, user_id: 3},
#   {fechaHora: "2017-01-06 08:24:00", actividad_proyecto_id: 17, estado_id: 3, proyecto_id: 6, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 19, estado_id: 1, proyecto_id: 7, user_id: 2},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 20, estado_id: 1, proyecto_id: 7, user_id: 2},
#   {fechaHora: "2017-01-01 08:21:00", actividad_proyecto_id: 21, estado_id: 1, proyecto_id: 7, user_id: 2},
#   {fechaHora: "2017-01-01 08:22:00", actividad_proyecto_id: 19, estado_id: 2, proyecto_id: 7, user_id: 2},
#   {fechaHora: "2017-01-02 08:22:00", actividad_proyecto_id: 20, estado_id: 2, proyecto_id: 7, user_id: 2},
#   {fechaHora: "2017-01-08 08:23:00", actividad_proyecto_id: 21, estado_id: 2, proyecto_id: 7, user_id: 2},
#   {fechaHora: "2017-01-01 08:23:00", actividad_proyecto_id: 19, estado_id: 3, proyecto_id: 7, user_id: 2},
#   {fechaHora: "2017-01-06 08:24:00", actividad_proyecto_id: 20, estado_id: 3, proyecto_id: 7, user_id: 2},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 22, estado_id: 1, proyecto_id: 8, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 23, estado_id: 1, proyecto_id: 8, user_id: 3},
#   {fechaHora: "2017-01-01 08:21:00", actividad_proyecto_id: 24, estado_id: 1, proyecto_id: 8, user_id: 3},
#   {fechaHora: "2017-01-01 08:22:00", actividad_proyecto_id: 22, estado_id: 2, proyecto_id: 8, user_id: 3},
#   {fechaHora: "2017-01-02 08:22:00", actividad_proyecto_id: 23, estado_id: 2, proyecto_id: 8, user_id: 3},
#   {fechaHora: "2017-01-08 08:23:00", actividad_proyecto_id: 24, estado_id: 2, proyecto_id: 8, user_id: 3},
#   {fechaHora: "2017-01-01 08:23:00", actividad_proyecto_id: 22, estado_id: 3, proyecto_id: 8, user_id: 3},
#   {fechaHora: "2017-01-06 08:24:00", actividad_proyecto_id: 23, estado_id: 3, proyecto_id: 8, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 25, estado_id: 1, proyecto_id: 9, user_id: 2},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 26, estado_id: 1, proyecto_id: 9, user_id: 2},
#   {fechaHora: "2017-01-01 08:21:00", actividad_proyecto_id: 27, estado_id: 1, proyecto_id: 9, user_id: 2},
#   {fechaHora: "2017-01-01 08:22:00", actividad_proyecto_id: 25, estado_id: 2, proyecto_id: 9, user_id: 2},
#   {fechaHora: "2017-01-02 08:22:00", actividad_proyecto_id: 26, estado_id: 2, proyecto_id: 9, user_id: 2},
#   {fechaHora: "2017-01-08 08:23:00", actividad_proyecto_id: 27, estado_id: 2, proyecto_id: 9, user_id: 2},
#   {fechaHora: "2017-01-01 08:23:00", actividad_proyecto_id: 25, estado_id: 3, proyecto_id: 9, user_id: 2},
#   {fechaHora: "2017-01-06 08:24:00", actividad_proyecto_id: 26, estado_id: 3, proyecto_id: 9, user_id: 2},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 28, estado_id: 1, proyecto_id: 10, user_id: 3},
#   {fechaHora: "2017-01-01 08:20:00", actividad_proyecto_id: 29, estado_id: 1, proyecto_id: 10, user_id: 3},
#   {fechaHora: "2017-01-01 08:21:00", actividad_proyecto_id: 30, estado_id: 1, proyecto_id: 10, user_id: 3},
#   {fechaHora: "2017-01-01 08:22:00", actividad_proyecto_id: 28, estado_id: 2, proyecto_id: 10, user_id: 3},
#   {fechaHora: "2017-01-02 08:22:00", actividad_proyecto_id: 29, estado_id: 2, proyecto_id: 10, user_id: 3},
#   {fechaHora: "2017-01-08 08:23:00", actividad_proyecto_id: 30, estado_id: 2, proyecto_id: 10, user_id: 3},
#   {fechaHora: "2017-01-01 08:23:00", actividad_proyecto_id: 28, estado_id: 3, proyecto_id: 10, user_id: 3},
#   {fechaHora: "2017-01-06 08:24:00", actividad_proyecto_id: 29, estado_id: 3, proyecto_id: 10, user_id: 3}
# ])


Descuento.create!([
   {nombre: "Descuento 10%", descripcion: "-", porcentaje: 10.0}
])

Interes.create!([
  {nombre: "Interes 20%", descripcion: "-", porcentaje: 20.0}
])

TipoDePago.create!([
  {nombre: "Efectivo"},
  {nombre: "Saldo de cuenta"}
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
  {fecha_inicio: "2017-01-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 7, proyecto_id: 1},
  {fecha_inicio: "2017-01-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 8, proyecto_id: 2},
  {fecha_inicio: "2017-01-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 10, proyecto_id: 3},
  {fecha_inicio: "2017-01-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 12, proyecto_id: 4},
  {fecha_inicio: "2017-01-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 14, proyecto_id: 5},
  {fecha_inicio: "2017-01-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 19, proyecto_id: 6},
  {fecha_inicio: "2017-01-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 18, proyecto_id: 7},
  {fecha_inicio: "2017-01-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 21, proyecto_id: 8},
  {fecha_inicio: "2017-01-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 23, proyecto_id: 9},
  {fecha_inicio: "2017-01-01", fecha_fin: "2017-04-30", persona_proyecto_id: nil, persona_id: 25, proyecto_id: 10}
])

CuotaPorCliente.create!([
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 1, proyecto_id: 1, contrato_id: 1, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 2, proyecto_id: 1, contrato_id: 1, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 3, proyecto_id: 1, contrato_id: 1, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 4, proyecto_id: 1, contrato_id: 1, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 1, proyecto_id: 2, contrato_id: 2, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 2, proyecto_id: 2, contrato_id: 2, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 3, proyecto_id: 2, contrato_id: 2, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 4, proyecto_id: 2, contrato_id: 2, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 1, proyecto_id: 3, contrato_id: 3, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 2, proyecto_id: 3, contrato_id: 3, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 3, proyecto_id: 3, contrato_id: 3, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 4, proyecto_id: 3, contrato_id: 3, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 1, proyecto_id: 4, contrato_id: 4, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 2, proyecto_id: 4, contrato_id: 4, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 3, proyecto_id: 4, contrato_id: 4, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 4, proyecto_id: 4, contrato_id: 4, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 1, proyecto_id: 5, contrato_id: 5, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 2, proyecto_id: 5, contrato_id: 5, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 3, proyecto_id: 5, contrato_id: 5, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 4, proyecto_id: 5, contrato_id: 5, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 1, proyecto_id: 6, contrato_id: 6, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 2, proyecto_id: 6, contrato_id: 6, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 3, proyecto_id: 6, contrato_id: 6, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 4, proyecto_id: 6, contrato_id: 6, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 1, proyecto_id: 7, contrato_id: 7, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 2, proyecto_id: 7, contrato_id: 7, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 3, proyecto_id: 7, contrato_id: 7, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 4, proyecto_id: 7, contrato_id: 7, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 1, proyecto_id: 8, contrato_id: 8, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 2, proyecto_id: 8, contrato_id: 8, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 3, proyecto_id: 8, contrato_id: 8, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 4, proyecto_id: 8, contrato_id: 8, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 1, proyecto_id: 9, contrato_id: 9, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 2, proyecto_id: 9, contrato_id: 9, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 3, proyecto_id: 9, contrato_id: 9, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 4, proyecto_id: 9, contrato_id: 9, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 1, proyecto_id: 10, contrato_id: 10, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 2, proyecto_id: 10, contrato_id: 10, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 3, proyecto_id: 10, contrato_id: 10, pago_id: nil, descuento_id: nil},
  {montoTotal: 200.0, estado: false, concepto_de_pago_id: 4, proyecto_id: 10, contrato_id: 10, pago_id: nil, descuento_id: nil}
])

Cuenta.create!([
  {saldo: 0.0, proyecto_id: 1},
  {saldo: 0.0, proyecto_id: 2},
  {saldo: 0.0, proyecto_id: 3},
  {saldo: 0.0, proyecto_id: 4},
  {saldo: 0.0, proyecto_id: 5},
  {saldo: 0.0, proyecto_id: 6},
  {saldo: 0.0, proyecto_id: 7},
  {saldo: 0.0, proyecto_id: 8},
  {saldo: 0.0, proyecto_id: 9},
  {saldo: 0.0, proyecto_id: 10}
])


Audited::Adapters::ActiveRecord::Audit.update_all(user_id: 1)

Configuracion.create!([
  {logo: "Peak-Startup-Logo.png", nombre: "Peak Startup", eslogan: "", cuit: "30-54570225-4", condicion_iva: "ri", numero_abandono: 15, tiempo_abandono: "minutes", calle: "Av. Corrientes", nro_domicilio: "4287", piso: "", dpto: "", telefono: "4401604", email: nil, pag_web: "peakstartup@gmail.com", pais_id: 1, provincia_id: 1, ciudad_id: 1, area_id: 1, logotipo: nil}
])

#--------------------------------------------------------

