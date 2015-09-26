Rails.application.routes.draw do
  devise_for :users
  resources :exams do
    resources :groups do
      resources :students
      resources :scores
    end
    resources :tasks
  end

  resources :skills

  root 'exams#index'
end
