class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    # GemのKaminariを使ってページネーションを実装すると良い
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to users_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:introduction, :image)
  end
end
