Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace "api" do
    resources :products do
      collection do
        #products/product_id/get_by_name
        get 'get_by_name'
      end
    end
    resources :categories
  end

  scope 'api' do 
    mount_devise_token_auth_for 'User', at: 'auth'
  end

end
