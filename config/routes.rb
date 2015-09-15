Rails.application.routes.draw do
  resources :exams do
    resources :groups do
      resources :students
    end
    resources :tasks
    resources :scores
  end

  resources :skills

  root 'exams#index'
end
