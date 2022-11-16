class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :validate_post_owner, only: [:edit, :update, :destroy]
  require 'csv'

  def index
    @posts = Post.includes(:categories, :user, :region, :province).page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.json { render json: @posts, each_serializer: PostSerializer }
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << [User.human_attribute_name(:email), Post.human_attribute_name(:id), Post.human_attribute_name(:title), Post.human_attribute_name(:content), Post.human_attribute_name(:categories), Post.human_attribute_name(:created_at)]
          @posts.each do |p|
            csv << [p.user.email, p.id, p.title, p.content, p.categories.pluck(:name).join(','), p.created_at]
          end
        end
        render plain: csv_string
      }
      format.xml { render xml: @posts.as_json }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @post, serializer: PostSerializer }
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image, :address_region_id, :address_province_id, category_ids: [])
  end

  def validate_post_owner
    unless @post.user == current_user
      flash[:notice] = 'the post not belongs to you'
      redirect_to posts_path
    end
  end
end
