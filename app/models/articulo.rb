class Articulo < ApplicationRecord
	has_many :comentarios
	has_many :respuesta_comentario
	has_many :articulos
end
