Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :data, only: %i[index]

    end
  end

  get '*path', to: 'application#fallback_index_html', constraints: lambda {
      |request| !request.xhr? && request.format.html?
  }
end
