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

ActiveRecord::Schema.define(version: 20161215224702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articulos", force: :cascade do |t|
    t.string   "titulo"
    t.text     "parrafo"
    t.text     "parrafo_principal"
    t.string   "autor"
    t.datetime "fecha_subida"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "categoria", force: :cascade do |t|
    t.integer  "id_categoria"
    t.string   "nombre_categoria"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.integer  "articulo_id"
    t.string   "email"
    t.string   "sitio"
    t.text     "mensaje"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "avatar"
    t.index ["articulo_id"], name: "index_comentarios_on_articulo_id", using: :btree
  end

  create_table "empleados", force: :cascade do |t|
    t.string  "nombre",   limit: 100
    t.string  "apellido", limit: 100
    t.integer "edad"
  end

  create_table "encuesta_articulos", force: :cascade do |t|
    t.integer  "poco_util"
    t.integer  "regular"
    t.integer  "interesante"
    t.integer  "bueno"
    t.integer  "excelente"
    t.integer  "articulo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["articulo_id"], name: "index_encuesta_articulos_on_articulo_id", using: :btree
  end

  create_table "inicios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "edad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "respuesta_comentarios", force: :cascade do |t|
    t.integer  "articulo_id"
    t.integer  "comentario_id"
    t.string   "email"
    t.string   "sitio"
    t.text     "mensaje"
    t.datetime "fecha_subida"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "avatar"
    t.index ["articulo_id"], name: "index_respuesta_comentarios_on_articulo_id", using: :btree
    t.index ["comentario_id"], name: "index_respuesta_comentarios_on_comentario_id", using: :btree
  end

  add_foreign_key "comentarios", "articulos"
  add_foreign_key "encuesta_articulos", "articulos"
  add_foreign_key "respuesta_comentarios", "articulos"
  add_foreign_key "respuesta_comentarios", "comentarios"
end
