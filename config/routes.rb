Rails.application.routes.draw do
  devise_for :patients, path: :patients, controllers: {
    registrations: 'patients/registrations'
  }

  devise_for :doctors, path: :doctors, skip: %i[registrations]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :patient do
    authenticated :patient do
      scope module: :patients do
        get :profile, to: 'profile#show', as: :patient_root
        resources :doctors, only: :index
        resources :appointments, only: %i[index new create]
      end
    end
  end

  devise_scope :doctor do
    authenticated :doctor do
      scope module: :doctors do
        get :profile, to: 'profile#show', as: :doctor_root
        resources :appointments, only: :index do
          resources :recommendations, only: %i[new create]
        end
      end
    end
  end

  root to: redirect('/patients/sign_in')
  match '*path', to: redirect('/'), via: :all
end
