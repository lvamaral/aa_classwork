class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def show
    @post = post_display
  end

  def edit
    @post = post_display
  end

  def update

    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to post_url(@post)
    end
  end

  private

  def post_display
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:url, :title, :content, :author_id, sub_ids: [])
  end
end
