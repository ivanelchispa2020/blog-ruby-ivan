class CreateCategoria < ActiveRecord::Migration[5.0]
  def change
    create_table :categoria do |t|
      t.integer :id_categoria
      t.string :nombre_categoria

      t.timestamps
    end
  end
end
