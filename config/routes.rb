Rails.application.routes.draw do
  namespace :api do
    resources :movies, only: [:show] do
      collection do
        get 'release', to: 'movies#release'
        get 'top-rated', to: 'movies#top_rated'
      end
    end
  end
end
