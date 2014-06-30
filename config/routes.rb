G5Updatable::Engine.routes.draw do
  get "/" => "feed#index"
  get "/name" => "feed#client_name"
  post "/update" => "feed#update"
end
