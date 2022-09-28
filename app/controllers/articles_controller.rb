class ArticlesController < ApplicationController

before_action :set_article, only: [:show, :edit, :update, :destroy]
before_action :require_user, except: [:show, :index]
before_action :require_same_user, only:[:edit, :update, :destroy]

  def show
  end

  def index
     @articles = Article.paginate(page: params[:page], per_page: 4)
   end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(params_article)
    @article.user = current_user
    @article.update_at = Time.now
    if @article.save

    flash[:notice] = "Article created successfully"

    redirect_to @article

  else
    render 'new'
    end
  end

  def update
    @article.update_at = Time.now
    if @article.update(params_article)
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy

    @article.destroy
    flash[:notice] = "Article deleted"
    redirect_to articles_path
  end

private

  def set_article
    @article = Article.find(params[:id])
  end

 def params_article
   params.require(:article).permit(:title, :description, category_ids:[] )
 end

   def require_same_user
     if current_user != @article.user && !current_user.admin?
       flash[:alert] = "You can only edit your account"
     end
   end
 end
