class CreateRespuestaComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :respuesta_comentarios do |t|
      t.references :articulo, foreign_key: true
      t.references :comentario, foreign_key: true
      t.string :email
      t.string :sitio
      t.text :mensaje
      t.datetime :fecha_subida

      t.timestamps
    end
  end
end
