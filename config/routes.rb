Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :payments
    resources :payment_intents
    resources :payment_statuses
    resources :stock_movements
    resources :stock_movement_types
    resources :clients
    resources :product_stocks
    resources :products
    resources :currencies
    resources :categories
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  post 'authenticate', to: 'authentication#authenticate'
  get 'loggedInUser', to: 'clients#currentClient'
  get 'getstripeKey', to: 'payments#getStripeKey'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
