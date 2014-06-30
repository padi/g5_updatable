G5Updatable::Engine.routes.draw do
  post "/update" => "feed#update"
end
