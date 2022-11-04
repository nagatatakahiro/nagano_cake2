Rails.application.routes.draw do

  scope module: :public do
    get 'customers/current_customer' => "customers#show"
    get 'customers/current_customer/edit' => "customers#edit"
    get 'customers/confirm' => "customers#confirm", as: 'confirm'
    patch 'customers/out' => 'customers#out', as: 'out'
  end
  root to: 'homes#top'
  get '/about' => "homes#about"
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
