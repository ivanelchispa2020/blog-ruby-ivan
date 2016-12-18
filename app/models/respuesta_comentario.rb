class RespuestaComentario < ApplicationRecord
  belongs_to :articulo
  belongs_to :comentario
  mount_uploader :avatar, AvatarUploader


  #Validaciones de email
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato del correo es invalido" }
#Validaciones de descripción
validates :mensaje, :presence => {:message => "Usted debe ingresar un mensaje"}, length: {minimum: 2, maximum: 400, :message => "La descripción debe tener entre 2 y 400 caracteres"}

end
