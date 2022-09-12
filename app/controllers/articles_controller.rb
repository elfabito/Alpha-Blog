class ArticlesController < ApplicationController

before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
     @articles = Article.all
   end

  def new
    @article = Article.new
  end

  def edit
  end

  def create

    @article = Article.new(params_article)
    @article.update_at = Time.now
    if @article.save

    flash[:notice] = "Articulo creado correctamente"

    redirect_to @article

  else
    render 'new'
    end
  end

  def update
    @article.update_at = Time.now
    if @article.update(params_article)
      flash[:notice] = "Articulo actualizado correctamente"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy

    @article.destroy
    flash[:notice] = "Articulo borrado correctamente"
    redirect_to articles_path
  end

private

  def set_article
    @article = Article.find(params[:id])
  end

 def params_article
   params.require(:article).permit(:title, :description)
 end

end
