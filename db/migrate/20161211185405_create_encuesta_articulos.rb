class CreateEncuestaArticulos < ActiveRecord::Migration[5.0]
  def change
    create_table :encuesta_articulos do |t|
      t.integer :poco_util
      t.integer :regular
      t.integer :interesante
      t.integer :bueno
      t.integer :excelente
      t.references :articulo, foreign_key: true

      t.timestamps
    end
  end
end
