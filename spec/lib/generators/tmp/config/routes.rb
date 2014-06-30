      Rails.application.routes.draw do
        resource :home, only: [:show, :index]

        match '/some_path', to: 'controller#action', as: :my_alias

        root to: 'home#index'
      end
