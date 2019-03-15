Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/check', to: 'email_checker#check'
  get '/', to: "rails/welcome#index"
end
