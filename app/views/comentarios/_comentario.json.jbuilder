json.extract! comentario, :id, :articulo_id, :email, :sitio, :mensaje, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)