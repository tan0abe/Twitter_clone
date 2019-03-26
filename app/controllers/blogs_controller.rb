class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_to new_blog_path  #GETでBlogsコントローラのnewメソッドに飛ぶ(pathで相対パスを指定している)
  end

  def show
    @blog = Blog.find(params[:id])
  end


  private

  def blog_params  #createやupdateでも使うのでDRYの観点からメソッドとして定義している
    params.require(:blog).permit(:content)  #(content: params[:blog][:content])のStrong Parametersでの書き方。blogキーのtitleのみ取得を許可している)
  end
end
