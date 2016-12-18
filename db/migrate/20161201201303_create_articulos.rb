class CreateArticulos < ActiveRecord::Migration[5.0]
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.text :parrafo
      t.text :parrafo_principal
      t.string :autor
      t.datetime :fecha_subida

      t.timestamps
    end
  end
end
