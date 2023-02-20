Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #For Authentication
  post "authenticate", to: "authentication#authenticate"
  
  #Author
  get "author/check", to: "author#home"
  get "author/all", to:"author#index" # show all author

  get 'author/show_id', to:'author#specificAuthorById' # specific author by id

  put 'author/edit', to:"author#update" #update specific author by id

  post 'author/create', to:'author#create' #auhtor creation

  #Category
  get "article/all", to: "article#show"
  
  post "article/create", to:"article#create" # after creating category id it's important to notice this (Add article)

  get "article/byid", to: "article#byid"

  delete "article/delete", to:"article#delete" 

  put "article/edit", to:"article#edit" # edit through specific id
  
  get 'article/author_id', to:'article#searchByAuthors' # list all articles by author

  ## Category
  get 'category/all', to:'category#show'
  get 'category/id',to:'category#specificid'

  # Defines the root path route ("/")
  # root "articles#index"
end
