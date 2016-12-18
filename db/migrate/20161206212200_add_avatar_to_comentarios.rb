class AddAvatarToComentarios < ActiveRecord::Migration[5.0]
  def change
    add_column :comentarios, :avatar, :string
  end
end
