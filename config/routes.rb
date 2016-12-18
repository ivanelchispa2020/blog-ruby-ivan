Rails.application.routes.draw do
 
  resources :articulos do 
  	resources :comentarios
	resources :respuesta_comentarios 
	resources :encuesta_articulos
  end

   root :to => 'articulos#index'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
