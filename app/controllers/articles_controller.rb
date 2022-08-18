class ArticlesController<ApplicationController
def index 
    @articles=Article.all

end
def destroy
    
    @article=Article.find(params[:id])
    @article.destroy()
    @article.save
    flash[:notice]="Article was succ deleted"
    redirect_to article_path
end


    def new
    @article=Article.new
     
    end

def edit
    @article=Article.find(params[:id])
end

def update

    @article = Article.find(params[:id])
    
    if @article.update(article_params)
    
    flash[:notice] = "Article was successfully updated"
    
    redirect_to article_path(@article)
    
    else
    
    render 'edit'
    
    end
end

def show
    @article = Article.find(params[:id])
end

def create 
    
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
end

private

def article_params

    params.require(:article).permit(:title, :description)

end
end