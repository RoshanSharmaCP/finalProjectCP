class AuthorController < ApplicationController
    skip_before_action :verify_authenticity_token

    def home
        render html: "Author Controller"
    end

    def index
        @Author = Author.all
        render json: @Author
    end

    def create
        @Author = Author.create(name:params[:name],bio:params[:bio],email:params[:email],password_digest:params[:password_digest],author_img:params[:author_img])
        render json:@Author
    end

    def specificAuthorById
        @Author = Author.where(id: params[:id])
        render json:@Author
    end

    def update
        @Author = Author.find(params[:id])
        @Author.update(name:params[:name],bio:params[:bio],email:params[:email],password_digest:params[:password_digest],author_img:params[:author_img])
        render json:@Author
    end

end
