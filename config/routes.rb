Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'pictures#index'
    resources :pictures
    #
    # get 'pictures' => 'pictures#index'
    # get 'pictures/new' => 'pictures#new'
    # get 'pictures/:id' => 'pictures#show' as 'picture'
    # get 'pictures/:id/edit' => "pictures#edit"
    #
    # post 'pictures' => 'pictures#create'
    #
    # patch 'pictures/:id' => "pictures#update"
    #
    # delete 'pictures/:id' => 'pictures#destroy'
end
