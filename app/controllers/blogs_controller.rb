class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save  #saveに失敗した場合は@blogの中にエラーの情報が詰め込まれているのでnew.html.erbでエラーメッセージを表示したりすることが出来ている
    redirect_to blogs_path, noctice: "みんなについーとしました！"  #GETでBlogsコントローラのindexアクションに飛ぶ(pathで相対パスを指定している)
    else
      render 'new'  #createアクションが実行されるとViewは自動的にcreate.html.erbを選択するが存在しないためエラーになるので、new.html.erbに変更している
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end


  private

  def blog_params  #createやupdateでも使うのでDRYの観点からメソッドとして定義している
    params.require(:blog).permit(:content)  #(content: params[:blog][:content])のStrong Parametersでの書き方。blogキーのcontentのみ取得を許可している)
  end
end
