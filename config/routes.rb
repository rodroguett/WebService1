Rails.application.routes.draw do

  get '/rest/requester', to: 'rests#requester'
  get '/rest/result', to: 'rests#result'
  post '/rest/login', to: 'rests#login'

end
