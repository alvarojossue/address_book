Rails.application.routes.draw do
  get '/contacts', to: 'contacts#index'

  post '/contacts', to: 'contacts#create'

  get '/contacts/new', to: 'contacts#new'

  get '/contacts/:id', to: 'contacts#profile'

end
