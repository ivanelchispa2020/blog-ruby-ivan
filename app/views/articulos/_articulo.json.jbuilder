json.extract! articulo, :id, :titulo, :parrafo, :parrafo_principal, :autor, :fecha_subida, :created_at, :updated_at
json.url articulo_url(articulo, format: :json)