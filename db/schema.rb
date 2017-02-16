# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170215215300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acciones", force: :cascade do |t|
    t.string   "nombre"
    t.string   "key_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actividades", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.boolean  "obligatorio"
    t.text     "actividadesAntecedentes"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "etapa_id"
  end

  add_index "actividades", ["etapa_id"], name: "index_actividades_on_etapa_id", using: :btree

  create_table "actividades_proyectos", force: :cascade do |t|
    t.date     "fechaVencimiento"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "proyecto_id"
    t.integer  "actividad_id"
    t.integer  "estado_id"
  end

  add_index "actividades_proyectos", ["actividad_id"], name: "index_actividades_proyectos_on_actividad_id", using: :btree
  add_index "actividades_proyectos", ["estado_id"], name: "index_actividades_proyectos_on_estado_id", using: :btree
  add_index "actividades_proyectos", ["proyecto_id"], name: "index_actividades_proyectos_on_proyecto_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "ciudades", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "provincia_id"
    t.integer  "pais_id"
  end

  add_index "ciudades", ["pais_id"], name: "index_ciudades_on_pais_id", using: :btree
  add_index "ciudades", ["provincia_id"], name: "index_ciudades_on_provincia_id", using: :btree

  create_table "conceptos_de_pago", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.float    "monto"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "configuraciones", force: :cascade do |t|
    t.string   "logo"
    t.string   "nombre"
    t.string   "eslogan"
    t.string   "cuit"
    t.string   "condicion_iva"
    t.datetime "plazo_abandono"
    t.string   "calle"
    t.string   "nroDomicilio"
    t.string   "piso"
    t.string   "dpto"
    t.string   "telefono"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "pais_id"
    t.integer  "provincia_id"
    t.integer  "ciudad_id"
    t.integer  "area_id"
  end

  add_index "configuraciones", ["area_id"], name: "index_configuraciones_on_area_id", using: :btree
  add_index "configuraciones", ["ciudad_id"], name: "index_configuraciones_on_ciudad_id", using: :btree
  add_index "configuraciones", ["pais_id"], name: "index_configuraciones_on_pais_id", using: :btree
  add_index "configuraciones", ["provincia_id"], name: "index_configuraciones_on_provincia_id", using: :btree

  create_table "contactos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contratos", force: :cascade do |t|
    t.date     "fechaInicio"
    t.date     "fechaFin"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "persona_proyecto_id"
    t.integer  "persona_id"
    t.integer  "proyecto_id"
  end

  add_index "contratos", ["persona_id"], name: "index_contratos_on_persona_id", using: :btree
  add_index "contratos", ["persona_proyecto_id"], name: "index_contratos_on_persona_proyecto_id", using: :btree
  add_index "contratos", ["proyecto_id"], name: "index_contratos_on_proyecto_id", using: :btree

  create_table "cuentas", force: :cascade do |t|
    t.float    "saldo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "proyecto_id"
  end

  add_index "cuentas", ["proyecto_id"], name: "index_cuentas_on_proyecto_id", using: :btree

  create_table "cuotas_por_cliente", force: :cascade do |t|
    t.float    "montoTotal"
    t.float    "montoAcreditado"
    t.boolean  "estado"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "concepto_de_pago_id"
    t.integer  "proyecto_id"
    t.integer  "contrato_id"
    t.integer  "pago_id"
  end

  add_index "cuotas_por_cliente", ["concepto_de_pago_id"], name: "index_cuotas_por_cliente_on_concepto_de_pago_id", using: :btree
  add_index "cuotas_por_cliente", ["contrato_id"], name: "index_cuotas_por_cliente_on_contrato_id", using: :btree
  add_index "cuotas_por_cliente", ["pago_id"], name: "index_cuotas_por_cliente_on_pago_id", using: :btree
  add_index "cuotas_por_cliente", ["proyecto_id"], name: "index_cuotas_por_cliente_on_proyecto_id", using: :btree

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "descuentos", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.float    "porcentaje"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "empleados", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "especialidades_de_contacto", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string   "nombre"
    t.boolean  "ultimo"
    t.integer  "previous"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "etapas", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "etapaAnterior"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.date     "dia"
    t.time     "hora"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "contacto_id"
    t.integer  "persona_id"
  end

  add_index "eventos", ["contacto_id"], name: "index_eventos_on_contacto_id", using: :btree
  add_index "eventos", ["persona_id"], name: "index_eventos_on_persona_id", using: :btree

  create_table "eventos_proyectos", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "proyecto_id"
    t.integer  "evento_id"
  end

  add_index "eventos_proyectos", ["evento_id"], name: "index_eventos_proyectos_on_evento_id", using: :btree
  add_index "eventos_proyectos", ["proyecto_id"], name: "index_eventos_proyectos_on_proyecto_id", using: :btree

  create_table "historiales", force: :cascade do |t|
    t.datetime "fechaHora"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "actividad_proyecto_id"
    t.integer  "estado_id"
    t.integer  "proyecto_id"
  end

  add_index "historiales", ["actividad_proyecto_id"], name: "index_historiales_on_actividad_proyecto_id", using: :btree
  add_index "historiales", ["estado_id"], name: "index_historiales_on_estado_id", using: :btree
  add_index "historiales", ["proyecto_id"], name: "index_historiales_on_proyecto_id", using: :btree

  create_table "intereses", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.float    "porcentaje"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "miembros_equipo", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modelos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagos", force: :cascade do |t|
    t.date     "fecha"
    t.float    "montoAcreditado"
    t.float    "montoAPagar"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "tipo_de_pago_id"
    t.integer  "proyecto_id"
    t.integer  "persona_id"
    t.integer  "cuenta_id"
  end

  add_index "pagos", ["cuenta_id"], name: "index_pagos_on_cuenta_id", using: :btree
  add_index "pagos", ["persona_id"], name: "index_pagos_on_persona_id", using: :btree
  add_index "pagos", ["proyecto_id"], name: "index_pagos_on_proyecto_id", using: :btree
  add_index "pagos", ["tipo_de_pago_id"], name: "index_pagos_on_tipo_de_pago_id", using: :btree

  create_table "pagos_metodos", force: :cascade do |t|
    t.float    "monto"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "pago_id"
    t.integer  "tipo_de_pago_id"
  end

  add_index "pagos_metodos", ["pago_id"], name: "index_pagos_metodos_on_pago_id", using: :btree
  add_index "pagos_metodos", ["tipo_de_pago_id"], name: "index_pagos_metodos_on_tipo_de_pago_id", using: :btree

  create_table "paises", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permisos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "accion_id"
    t.integer  "modelo_id"
  end

  add_index "permisos", ["accion_id"], name: "index_permisos_on_accion_id", using: :btree
  add_index "permisos", ["modelo_id"], name: "index_permisos_on_modelo_id", using: :btree

  create_table "permisos_roles", id: false, force: :cascade do |t|
    t.integer "permiso_id"
    t.integer "rol_id"
  end

  add_index "permisos_roles", ["permiso_id"], name: "index_permisos_roles_on_permiso_id", using: :btree
  add_index "permisos_roles", ["rol_id"], name: "index_permisos_roles_on_rol_id", using: :btree

  create_table "personas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "nroIdentificacion"
    t.date     "fechaNacimiento"
    t.string   "calle"
    t.string   "nroDomicilio"
    t.string   "piso"
    t.string   "dpto"
    t.string   "telefono"
    t.string   "email"
    t.string   "type"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "pais_id"
    t.integer  "provincia_id"
    t.integer  "ciudad_id"
    t.integer  "tipo_documento_id"
    t.integer  "departamento_id"
    t.integer  "especialidad_de_contacto_id"
    t.integer  "area_id"
    t.integer  "rol_de_empleado_id"
  end

  add_index "personas", ["area_id"], name: "index_personas_on_area_id", using: :btree
  add_index "personas", ["ciudad_id"], name: "index_personas_on_ciudad_id", using: :btree
  add_index "personas", ["departamento_id"], name: "index_personas_on_departamento_id", using: :btree
  add_index "personas", ["especialidad_de_contacto_id"], name: "index_personas_on_especialidad_de_contacto_id", using: :btree
  add_index "personas", ["pais_id"], name: "index_personas_on_pais_id", using: :btree
  add_index "personas", ["provincia_id"], name: "index_personas_on_provincia_id", using: :btree
  add_index "personas", ["rol_de_empleado_id"], name: "index_personas_on_rol_de_empleado_id", using: :btree
  add_index "personas", ["tipo_documento_id"], name: "index_personas_on_tipo_documento_id", using: :btree

  create_table "personas_proyectos", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "proyecto_id"
    t.integer  "persona_id"
  end

  add_index "personas_proyectos", ["persona_id"], name: "index_personas_proyectos_on_persona_id", using: :btree
  add_index "personas_proyectos", ["proyecto_id"], name: "index_personas_proyectos_on_proyecto_id", using: :btree

  create_table "provincias", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pais_id"
  end

  add_index "provincias", ["pais_id"], name: "index_provincias_on_pais_id", using: :btree

  create_table "proyectos", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "calle"
    t.string   "nroDomicilio"
    t.string   "piso"
    t.string   "dpto"
    t.string   "telefono"
    t.string   "email"
    t.string   "pagWeb"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "pais_id"
    t.integer  "provincia_id"
    t.integer  "ciudad_id"
    t.integer  "etapa_id"
    t.integer  "area_id"
  end

  add_index "proyectos", ["area_id"], name: "index_proyectos_on_area_id", using: :btree
  add_index "proyectos", ["ciudad_id"], name: "index_proyectos_on_ciudad_id", using: :btree
  add_index "proyectos", ["etapa_id"], name: "index_proyectos_on_etapa_id", using: :btree
  add_index "proyectos", ["pais_id"], name: "index_proyectos_on_pais_id", using: :btree
  add_index "proyectos", ["provincia_id"], name: "index_proyectos_on_provincia_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_de_empleados", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "departamento_id"
  end

  add_index "roles_de_empleados", ["departamento_id"], name: "index_roles_de_empleados_on_departamento_id", using: :btree

  create_table "tipo_documentos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos_de_pago", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "persona_id"
    t.integer  "rol_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["persona_id"], name: "index_users_on_persona_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["rol_id"], name: "index_users_on_rol_id", using: :btree

  create_table "vencimientos", force: :cascade do |t|
    t.date     "fecha"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "concepto_de_pago_id"
    t.integer  "interes_id"
  end

  add_index "vencimientos", ["concepto_de_pago_id"], name: "index_vencimientos_on_concepto_de_pago_id", using: :btree
  add_index "vencimientos", ["interes_id"], name: "index_vencimientos_on_interes_id", using: :btree

  add_foreign_key "actividades", "etapas"
  add_foreign_key "actividades_proyectos", "actividades"
  add_foreign_key "actividades_proyectos", "estados"
  add_foreign_key "actividades_proyectos", "proyectos"
  add_foreign_key "ciudades", "paises"
  add_foreign_key "ciudades", "provincias"
  add_foreign_key "configuraciones", "areas"
  add_foreign_key "configuraciones", "ciudades"
  add_foreign_key "configuraciones", "paises"
  add_foreign_key "configuraciones", "provincias"
  add_foreign_key "contratos", "personas"
  add_foreign_key "contratos", "personas_proyectos"
  add_foreign_key "contratos", "proyectos"
  add_foreign_key "cuentas", "proyectos"
  add_foreign_key "cuotas_por_cliente", "conceptos_de_pago"
  add_foreign_key "cuotas_por_cliente", "contratos"
  add_foreign_key "cuotas_por_cliente", "pagos"
  add_foreign_key "cuotas_por_cliente", "proyectos"
  add_foreign_key "eventos", "contactos"
  add_foreign_key "eventos", "personas"
  add_foreign_key "eventos_proyectos", "eventos"
  add_foreign_key "eventos_proyectos", "proyectos"
  add_foreign_key "historiales", "actividades_proyectos"
  add_foreign_key "historiales", "estados"
  add_foreign_key "historiales", "proyectos"
  add_foreign_key "pagos", "cuentas"
  add_foreign_key "pagos", "personas"
  add_foreign_key "pagos", "proyectos"
  add_foreign_key "pagos", "tipos_de_pago"
  add_foreign_key "pagos_metodos", "pagos"
  add_foreign_key "pagos_metodos", "tipos_de_pago"
  add_foreign_key "permisos", "acciones"
  add_foreign_key "permisos", "modelos"
  add_foreign_key "personas", "areas"
  add_foreign_key "personas", "ciudades"
  add_foreign_key "personas", "departamentos"
  add_foreign_key "personas", "especialidades_de_contacto"
  add_foreign_key "personas", "paises"
  add_foreign_key "personas", "provincias"
  add_foreign_key "personas", "roles_de_empleados"
  add_foreign_key "personas", "tipo_documentos"
  add_foreign_key "personas_proyectos", "personas"
  add_foreign_key "personas_proyectos", "proyectos"
  add_foreign_key "provincias", "paises"
  add_foreign_key "proyectos", "areas"
  add_foreign_key "proyectos", "ciudades"
  add_foreign_key "proyectos", "etapas"
  add_foreign_key "proyectos", "paises"
  add_foreign_key "proyectos", "provincias"
  add_foreign_key "roles_de_empleados", "departamentos"
  add_foreign_key "users", "personas"
  add_foreign_key "users", "roles"
  add_foreign_key "vencimientos", "conceptos_de_pago"
  add_foreign_key "vencimientos", "intereses"
end
