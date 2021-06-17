Rails.application.routes.draw do
  get '/home' => 'home#index'
  root to: 'home#index'

  get '/home/quiz' => 'home#quiz'
  get '/home/reloadQuiz' => 'home#reloadQuiz'
  post '/home/submit' => 'home#submit'
  post '/home/setTotal' => 'home#setTotal'

end
