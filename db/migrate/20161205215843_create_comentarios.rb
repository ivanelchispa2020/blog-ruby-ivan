class CreateComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios do |t|
      t.references :articulo, foreign_key: true
      t.string :email
      t.string :sitio
      t.text :mensaje

      t.timestamps
    end
  end
end
