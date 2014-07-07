# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

RedmineApp::Application.routes.draw do
  post 'author_adder/:project_id/', :to => 'author_adder#edit', :as => 'author_adder'
end