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
  {auditable_id: 1, auditable_type: "Proyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"proyecto 1", "descripcion"=>"Soy el proyecto 1", "calle"=>"176", "nroDomicilio"=>"7141", "piso"=>"", "dpto"=>"", "telefono"=>"", "email"=>"", "pagWeb"=>"", "pais_id"=>1, "provincia_id"=>1, "ciudad_id"=>1, "etapa_id"=>1, "area_id"=>1}, version: 1, comment: nil, remote_address: nil, request_uuid: "55b991c3-9e64-4a12-9bf0-875203b32fef"},
  {auditable_id: 2, auditable_type: "Proyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Trip -Drop, Turismo Solidario", "descripcion"=>"Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.", "calle"=>"Av. San Martin", "nroDomicilio"=>"3141", "piso"=>"", "dpto"=>"", "telefono"=>"3758 423099", "email"=>"tripdrop@gmail.com", "pagWeb"=>"tripdrop.com", "pais_id"=>1, "provincia_id"=>1, "ciudad_id"=>2, "etapa_id"=>1, "area_id"=>1}, version: 1, comment: nil, remote_address: nil, request_uuid: "b1d81fda-4021-406b-9239-9d55e1670d24"},
  {auditable_id: 1, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>1, "actividad_id"=>1, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "76bcdc94-ab1e-4405-91eb-dd16d2e5e161"},
  {auditable_id: 2, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>1, "actividad_id"=>2, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "fc8458ee-36d2-42d0-97dc-f049e33087c1"},
  {auditable_id: 3, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>1, "actividad_id"=>3, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "61aeede5-8fb8-450f-b316-a2260684c093"},
  {auditable_id: 4, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>2, "actividad_id"=>1, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "b632ddee-fc17-4a65-bfb2-bd1802a2c4f2"},
  {auditable_id: 5, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>2, "actividad_id"=>2, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "5b1cb35e-f1fb-4264-98d4-23adff79557f"},
  {auditable_id: 6, auditable_type: "ActividadProyecto", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fechaVencimiento"=>nil, "proyecto_id"=>2, "actividad_id"=>3, "estado_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "4cb7bc8e-7941-4897-98a3-e1c8e208c6e4"},
  {auditable_id: 1, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Enero", "descripcion"=>"Enero 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "f629f1b0-1453-4edf-99a3-5942eb56f31c"},
  {auditable_id: 2, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Febrero", "descripcion"=>"Febrero 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "6ea6fed2-fe85-4f05-b82b-5f9071c7ebf6"},
  {auditable_id: 3, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Marzo", "descripcion"=>"Marzo 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "26411f5d-c30c-492a-8017-120371819788"},
  {auditable_id: 4, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Abril", "descripcion"=>"Abril 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "df85c928-7d51-44da-9ad2-706d4e089b84"},
  {auditable_id: 5, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Mayo", "descripcion"=>"Mayo 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "c20502f3-90c7-4163-a3c1-8f818c245f9c"},
  {auditable_id: 6, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Junio", "descripcion"=>"Junio 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "21cba0ea-c6f0-4d8e-b0af-7e0308efec65"},
  {auditable_id: 7, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Julio", "descripcion"=>"Julio 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "9d9d2438-267c-4dda-b876-f93e43d84796"},
  {auditable_id: 8, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Agosto", "descripcion"=>"Agosto 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "364b92f3-d146-4634-ba64-b364a56d50f9"},
  {auditable_id: 9, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Septiembre", "descripcion"=>"Septiembre 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "815da732-8a26-4081-99fc-657fe4e8437b"},
  {auditable_id: 10, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Octubre", "descripcion"=>"Octubre 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "2432e33c-52eb-405a-9fb4-4bb6224244a8"},
  {auditable_id: 11, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Noviembre", "descripcion"=>"Noviembre 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "513423ca-62bf-4794-8187-b6bbc1be3f2c"},
  {auditable_id: 12, auditable_type: "ConceptoDePago", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"nombre"=>"Cuota de Diciembre", "descripcion"=>"Diciembre 2017", "monto"=>200.0}, version: 1, comment: nil, remote_address: nil, request_uuid: "86aa9bb4-52ea-4d59-99ec-0eb34ad25991"},
  {auditable_id: 1, auditable_type: "Contrato", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fecha_inicio"=>"Wed, 01 Feb 2017", "fecha_fin"=>"Sun, 30 Apr 2017", "persona_proyecto_id"=>nil, "persona_id"=>6, "proyecto_id"=>1}, version: 1, comment: nil, remote_address: nil, request_uuid: "128e0594-24c4-4fe2-8331-33c10187b0ed"},
  {auditable_id: 2, auditable_type: "Contrato", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"fecha_inicio"=>"Wed, 01 Feb 2017", "fecha_fin"=>"Wed, 31 May 2017", "persona_proyecto_id"=>nil, "persona_id"=>2, "proyecto_id"=>2}, version: 1, comment: nil, remote_address: nil, request_uuid: "91916063-3a4b-4b96-8445-fbb0aa0ac36b"},
  {auditable_id: 1, auditable_type: "CuotaPorCliente", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"montoTotal"=>200.0, "estado"=>false, "concepto_de_pago_id"=>2, "proyecto_id"=>1, "contrato_id"=>1, "pago_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "8b596dd0-b00a-4b0e-8cdb-92ffeccca2f9"},
  {auditable_id: 2, auditable_type: "CuotaPorCliente", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"montoTotal"=>200.0, "estado"=>false, "concepto_de_pago_id"=>3, "proyecto_id"=>1, "contrato_id"=>1, "pago_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "9435595b-45d4-443d-b751-a2afca2ad7a0"},
  {auditable_id: 3, auditable_type: "CuotaPorCliente", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"montoTotal"=>200.0, "estado"=>false, "concepto_de_pago_id"=>4, "proyecto_id"=>1, "contrato_id"=>1, "pago_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "2f3e4e29-7d27-4eb5-b73a-208ac7e7267f"},
  {auditable_id: 4, auditable_type: "CuotaPorCliente", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"montoTotal"=>200.0, "estado"=>false, "concepto_de_pago_id"=>2, "proyecto_id"=>2, "contrato_id"=>2, "pago_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "ad2f7f01-03a6-4c39-8a2b-ac0a17566186"},
  {auditable_id: 5, auditable_type: "CuotaPorCliente", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"montoTotal"=>200.0, "estado"=>false, "concepto_de_pago_id"=>3, "proyecto_id"=>2, "contrato_id"=>2, "pago_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "75e46324-2333-4abc-acb9-c222c60a2dae"},
  {auditable_id: 6, auditable_type: "CuotaPorCliente", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"montoTotal"=>200.0, "estado"=>false, "concepto_de_pago_id"=>4, "proyecto_id"=>2, "contrato_id"=>2, "pago_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "af289f06-8b78-4db9-88e6-7f2cc1366b8c"},
  {auditable_id: 7, auditable_type: "CuotaPorCliente", associated_id: nil, associated_type: nil, user_id: nil, user_type: nil, username: nil, action: "create", audited_changes: {"montoTotal"=>200.0, "estado"=>false, "concepto_de_pago_id"=>5, "proyecto_id"=>2, "contrato_id"=>2, "pago_id"=>nil}, version: 1, comment: nil, remote_address: nil, request_uuid: "27744d67-e9bc-4067-a5ee-14f2c55a2629"}
])



#--------------------------------------------------------

