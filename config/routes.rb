Rails.application.routes.draw do
  resources :exams do
    resources :groups do
      resources :students
    end
  end

  resources :tasks

  root 'exams#index'
end
