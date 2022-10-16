Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
