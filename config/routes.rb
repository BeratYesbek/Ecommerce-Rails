Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace "api" do
    resources :products do

    end
    resources :categories

  end

end
