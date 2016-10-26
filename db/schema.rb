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

ActiveRecord::Schema.define(version: 20161026005907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actividades", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.boolean  "obligatorio"
    t.date     "fechaEstimada"
    t.date     "fechaActual"
    t.text     "actividadesAntecedentes"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "etapa_id"
  end

  add_index "actividades", ["etapa_id"], name: "index_actividades_on_etapa_id", using: :btree

  create_table "actividades_proyectos", force: :cascade do |t|
    t.date     "fechaInicio"
    t.date     "fechaFin"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "proyecto_id"
    t.integer  "actividad_id"
  end

  add_index "actividades_proyectos", ["actividad_id"], name: "index_actividades_proyectos_on_actividad_id", using: :btree
  add_index "actividades_proyectos", ["proyecto_id"], name: "index_actividades_proyectos_on_proyecto_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ciudades", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "provincia_id"
    t.integer  "pais_id"
  end

  add_index "ciudades", ["pais_id"], name: "index_ciudades_on_pais_id", using: :btree
  add_index "ciudades", ["provincia_id"], name: "index_ciudades_on_provincia_id", using: :btree

  create_table "contactos", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "especialidad_de_contacto_id"
  end

  add_index "contactos", ["especialidad_de_contacto_id"], name: "index_contactos_on_especialidad_de_contacto_id", using: :btree

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "etapas", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.date     "dia"
    t.time     "hora"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "contacto_id"
  end

  add_index "eventos", ["contacto_id"], name: "index_eventos_on_contacto_id", using: :btree

  create_table "miembros_equipo", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagos", force: :cascade do |t|
    t.date     "dia"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "proyecto_id"
    t.integer  "tipo_de_pago_id"
  end

  add_index "pagos", ["proyecto_id"], name: "index_pagos_on_proyecto_id", using: :btree
  add_index "pagos", ["tipo_de_pago_id"], name: "index_pagos_on_tipo_de_pago_id", using: :btree

  create_table "paises", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "pais_id"
    t.integer  "provincia_id"
    t.integer  "ciudad_id"
    t.integer  "tipo_documento_id"
    t.integer  "departamento_id"
  end

  add_index "personas", ["ciudad_id"], name: "index_personas_on_ciudad_id", using: :btree
  add_index "personas", ["departamento_id"], name: "index_personas_on_departamento_id", using: :btree
  add_index "personas", ["pais_id"], name: "index_personas_on_pais_id", using: :btree
  add_index "personas", ["provincia_id"], name: "index_personas_on_provincia_id", using: :btree
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
  end

  add_index "proyectos", ["ciudad_id"], name: "index_proyectos_on_ciudad_id", using: :btree
  add_index "proyectos", ["etapa_id"], name: "index_proyectos_on_etapa_id", using: :btree
  add_index "proyectos", ["pais_id"], name: "index_proyectos_on_pais_id", using: :btree
  add_index "proyectos", ["provincia_id"], name: "index_proyectos_on_provincia_id", using: :btree

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
    t.float    "monto"
    t.date     "plazoInicio"
    t.date     "plazoFin"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "actividades", "etapas"
  add_foreign_key "actividades_proyectos", "actividades"
  add_foreign_key "actividades_proyectos", "proyectos"
  add_foreign_key "ciudades", "paises"
  add_foreign_key "ciudades", "provincias"
  add_foreign_key "contactos", "especialidades_de_contacto"
  add_foreign_key "eventos", "contactos"
  add_foreign_key "pagos", "proyectos"
  add_foreign_key "pagos", "tipos_de_pago"
  add_foreign_key "personas", "ciudades"
  add_foreign_key "personas", "departamentos"
  add_foreign_key "personas", "paises"
  add_foreign_key "personas", "provincias"
  add_foreign_key "personas", "tipo_documentos"
  add_foreign_key "personas_proyectos", "personas"
  add_foreign_key "personas_proyectos", "proyectos"
  add_foreign_key "provincias", "paises"
  add_foreign_key "proyectos", "ciudades"
  add_foreign_key "proyectos", "etapas"
  add_foreign_key "proyectos", "paises"
  add_foreign_key "proyectos", "provincias"
  add_foreign_key "roles_de_empleados", "departamentos"
end
