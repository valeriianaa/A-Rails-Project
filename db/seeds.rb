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

Descuento.create!([
   {nombre: "Descuento 10%", descripcion: "-", porcentaje: 10.0}
])

Interes.create!([
  {nombre: "Interes 20%", descripcion: "-", porcentaje: 20.0}
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

Accion.create!([
  {nombre: "Crear", key_name: "create"},
  {nombre: "Editar", key_name: "edit"},
  {nombre: "Eliminar", key_name: "destroy"},
  {nombre: "Ver", key_name: "show"}
])

Modelo.create!([
  {nombre: "Empleado"}
])

Permiso.create!([
  {accion_id: 1, modelo_id: 1},
  {accion_id: 2, modelo_id: 1},
  {accion_id: 3, modelo_id: 1},
  {accion_id: 4, modelo_id: 1}
])

Rol.create!([
  {nombre: "admin_empleados"},
  {nombre: "super_admin"}
])

User.create!([
  {email: "mq@gmail.com", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, persona_id: 2, rol_id: 1},
  {email: "valeriianaa@gmail.com", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, persona_id: 1, rol_id: 2}
])

Audited::Adapters::ActiveRecord::Audit.create!([
  {auditable_id: 1, auditable_type: "Proyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"proyecto 1", "descripcion"=>"Soy el proyecto 1", "calle"=>"176", "nroDomicilio"=>"7141", "piso"=>"", "dpto"=>"", "telefono"=>"", "email"=>"", "pagWeb"=>"", "pais_id"=>1, "provincia_id"=>1, "ciudad_id"=>1, "etapa_id"=>1, "area_id"=>1}, version: 1, comment: nil, remote_address: nil, request_uuid: "5d2ed0fe-3822-496d-96d4-6d9f3b443746"},
  {auditable_id: 2, auditable_type: "Proyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Trip -Drop, Turismo Solidario", "descripcion"=>"Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.", "calle"=>"Av. San Martin", "nroDomicilio"=>"3141", "piso"=>"", "dpto"=>"", "telefono"=>"3758 423099", "email"=>"tripdrop@gmail.com", "pagWeb"=>"tripdrop.com", "pais_id"=>1, "provincia_id"=>1, "ciudad_id"=>2, "etapa_id"=>1, "area_id"=>1}, version: 1, comment: nil, remote_address: nil, request_uuid: "82b98c13-ba3e-4fb7-b81c-dca42dce16b1"},
  {auditable_id: 1, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>1, "actividad_id"=>1, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "1b6855c9-72ff-4c43-8931-d922dd1f7b54"},
  {auditable_id: 2, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>1, "actividad_id"=>2, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "f880d9d9-d581-4c75-9762-93a30517dffa"},
  {auditable_id: 3, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>1, "actividad_id"=>3, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "290fc78d-042c-47dd-8eb9-2faaf8bc8920"},
  {auditable_id: 4, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>2, "actividad_id"=>1, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "7f0a5e87-213a-4698-aa41-7af70a3eded3"},
  {auditable_id: 5, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>2, "actividad_id"=>2, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "245e9912-b155-4b66-a4ca-447e72fe1898"},
  {auditable_id: 6, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>2, "actividad_id"=>3, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "7bb9c1ad-5a91-414a-96b7-2ffd9760bd6f"},
  {auditable_id: 1, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Enero", "descripcion"=>"Enero 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "3d38d9b4-a540-44bf-a98c-44278d9fedc0"},
  {auditable_id: 2, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Febrero", "descripcion"=>"Febrero 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "abb27ab1-5c35-4a49-8160-57d85fdfb7ff"},
  {auditable_id: 3, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Marzo", "descripcion"=>"Marzo 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "ad48c2a0-e018-4fcc-a939-3b4858c20111"},
  {auditable_id: 4, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Abril", "descripcion"=>"Abril 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "f48539a6-0e04-40d5-ab90-10a14390a416"},
  {auditable_id: 5, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Mayo", "descripcion"=>"Mayo 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "a47f0db3-9ceb-45fd-b148-2e0f65683c76"},
  {auditable_id: 6, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Junio", "descripcion"=>"Junio 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "6c7c190d-f36d-495d-9399-66d7e85d286e"},
  {auditable_id: 7, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Julio", "descripcion"=>"Julio 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "f9c4627d-0b69-4c07-aa86-4d80f8c6a26b"},
  {auditable_id: 8, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Agosto", "descripcion"=>"Agosto 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "fb0aa783-7e67-49ba-bd03-41910d123d85"},
  {auditable_id: 9, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Septiembre", "descripcion"=>"Septiembre 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "e6d8c61c-fcdf-4a5e-97a8-0c4fa83e681b"},
  {auditable_id: 10, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Octubre", "descripcion"=>"Octubre 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "7aa96ac1-7a2f-4d56-9e80-2e491b792ed0"},
  {auditable_id: 11, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Noviembre", "descripcion"=>"Noviembre 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "024a434e-4abc-4912-a999-ffba250ff4a5"},
  {auditable_id: 12, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: 2, user_type: "User", username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Diciembre", "descripcion"=>"Diciembre 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: "127.0.0.1", request_uuid: "7383b1b7-cb4b-47b7-bc3d-ff5a5fba928e"}
])

#--------------------------------------------------------



