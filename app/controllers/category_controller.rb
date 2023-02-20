class CategoryController < ApplicationController
    

    def show
        @Category = Category.all
        render json: @Category
    end

    def specificid
        @Category = Category.find(params[:id])
        render json:@Category
    end
    
end
