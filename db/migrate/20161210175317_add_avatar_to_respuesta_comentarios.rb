class AddAvatarToRespuestaComentarios < ActiveRecord::Migration[5.0]
  def change
    add_column :respuesta_comentarios, :avatar, :string
  end
end
