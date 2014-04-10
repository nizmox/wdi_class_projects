Routing::Application.routes.draw do
  root :to => 'pages#start'
  get '/start' => 'pages#start'
  get '/a' => 'pages#a'
  get '/b' => 'pages#b'
  get '/door' => 'pages#door'

  get '/1' => 'pages#one'
  get '/2' => 'pages#two'
  get '/3' => 'pages#three'
end
