Rails.application.routes.draw do

  root 'welcome#index'

  resources :ballot do
    member do
      get 'create_races'
    end
  end
  resources :race do
    member do
      get 'submit_vote_and_go_to_next_race'
      put 'submit_vote_and_return'
    end
  end
  resources :vote 

end
