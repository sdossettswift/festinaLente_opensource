Rails.application.routes.draw do
  resources :users, :projects, :expenses, :prints

  resources :events do
    member do
      get 'submit'
    end
    member do
      get 'reject'
    end
  end

  get 'timesheet' => 'events#timesheet', as: :timesheet
  get 'expense_report' => 'expenses#expense_report', as: :expense_report

	namespace :admin do
		resources :clients
end

	resources :clients do
	    get "delete"
	end

	resources :projects do
	    get "delete"
	end


	get 'admin' => 'admin#dashboard', as: :admin
  get 'dashboard' => 'users#dashboard', as: :dashboard


	get 'sign_in' => 'sessions#new', as: :sign_in
	post 'sign_in' => 'sessions#create'
	delete 'sign_in' => 'sessions#delete', as: :end_session
	get 'sign_out' => 'sessions#delete', as: :sign_out

	root 'welcome#calendar'
end
