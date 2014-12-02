Rails.application.routes.draw do

  root 'welcome#index'

  resources :ballot do
    member do
      get 'create_races'
      get 'instructions'
      get 'completed'
    end
  end
  resources :race do
    member do
      # get 'submit_vote_and_go_to_next_race'
      # get 'submit_vote_and_return'
      post 'submit_vote'
    end
  end
  resources :vote 
  resources :demographics 

end
