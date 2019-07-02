class ArticlesController < ApplicationController

    def create 
       articles = Article.new
        articles.name =params[:name]
        articles.description = params[:description]
    
        if(articles.save)
            render json:{message:'created successfully'}
        else
            render json{message:'not created'}
        end
    end 


def index
    articles=Article.all
    render json: {'articles':articles}
end

  

def update
    articles = Article.find(params[:id].to_i)
    articles.name = params[:name]
    articles.description=params[:description]
    if(articles.update(article_params))
        render json:{message:'updated successfully'}
    else
        render json:{message:'not updated successfully'}
         
    end
end

def destroy
    article=Article.find(params[:id])
    if(article.destroy)
        render json:{message:'deleted successfully'}
    else
        render json:{message:'not deleted'}
    end
end

def article_params
    params.require(:article).permit(:name,:description)
end
end