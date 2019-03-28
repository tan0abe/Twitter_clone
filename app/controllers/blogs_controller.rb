class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]  #アクションのメソッドが実行される前にset_blogアクションを、show,edit,updateアクションのみで実行している

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
    @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save  #saveに失敗した場合は@blogの中にエラーの情報が詰め込まれているのでnew.html.erbでエラーメッセージを表示したりすることが出来ている
    redirect_to blogs_path, notice: "みんなについーとしました！"  #GETでBlogsコントローラのindexアクションに飛ぶ(pathで相対パスを指定している)
    else
      render 'new'  #createアクションが実行されるとViewは自動的にcreate.html.erbを選択するが存在しないためエラーになるので、new.html.erbに変更している
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @blog.update(blog_params)  #updateに引数(parametersで参照したもの）を与えると、その引数の値で更新できる
      redirect_to blogs_path, notice: "ついーとを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ついーとを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if@blog.invalid?
  end

  private

  def blog_params  #createやupdateでも使うのでDRYの観点からメソッドとして定義している
    params.require(:blog).permit(:content)  #(content: params[:blog][:content])のStrong Parametersでの書き方。blogキーのcontentのみ取得を許可している)
  end

  def set_blog
    @blog = Blog.find(params[:id])  #取得するのはidのみでストロングパラメータを使う必要がなければ、set_blogメソッドを使う
  end
end
