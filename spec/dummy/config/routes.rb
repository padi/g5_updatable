Rails.application.routes.draw do
  mount G5Updatable::Engine => "/client_feed"
end
