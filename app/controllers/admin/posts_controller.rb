class Admin::PostsController < AdminController
  def index
    @posts = Post.includes(:categories, :user, :region, :province).page(params[:page]).per(5)
    render 'posts/index'
  end
end
