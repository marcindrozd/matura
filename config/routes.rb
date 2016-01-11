Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :exams
    resources :users
    resources :tasks
    resources :groups do
      resources :students, only: [:index, :create, :destroy] do
        put :update_number, on: :collection
      end
    end
  end

  namespace :exam do
    resources :groups
    resources :students do
      resources :tasks
    end
  end

  namespace :reports do
    resources :groups, only: [:index, :show]
  end

  resources :exams, only: [] do
    put :set_current, on: :member
  end

  root 'exam/groups#index'
end
