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

ActiveRecord::Schema.define(version: 20161015210324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actividades", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.boolean  "obligatorio"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "empleados", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "etapas", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "miembros_equipo", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
  end

  add_index "personas", ["ciudad_id"], name: "index_personas_on_ciudad_id", using: :btree
  add_index "personas", ["pais_id"], name: "index_personas_on_pais_id", using: :btree
  add_index "personas", ["provincia_id"], name: "index_personas_on_provincia_id", using: :btree
  add_index "personas", ["tipo_documento_id"], name: "index_personas_on_tipo_documento_id", using: :btree

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
  end

  create_table "tipo_documentos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ciudades", "paises"
  add_foreign_key "ciudades", "provincias"
  add_foreign_key "personas", "ciudades"
  add_foreign_key "personas", "paises"
  add_foreign_key "personas", "provincias"
  add_foreign_key "personas", "tipo_documentos"
  add_foreign_key "provincias", "paises"
end
