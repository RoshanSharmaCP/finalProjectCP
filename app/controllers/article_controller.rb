class ArticleController < ApplicationController
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session
    protect_from_forgery with: :exception

    def show
        @Article = Article.joins(:author,:category).select("categories.*,authors.name,authors.author_img,articles.*")
        render json: @Article
    end

    def create
        @Article = Article.create(title:params[:title],article_text:params[:article_text],article_img:params[:article_img],description:params[:description],likes:params[:likes],duration:params[:duration],author_id:params[:author_id],category_id:params[:category_id])
        render json: @Article
    end

    def byid
        @Article = Article.joins(:author,:category).select("categories.*,authors.*,articles.*")
        @Article = @Article.find(params[:id])
        render json: @Article
    end

    def delete
        @Article = Article.find(params[:id])
        @Article.destroy
        render json: @Article
    end

end
