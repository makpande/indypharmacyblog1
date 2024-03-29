class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
   @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
   @post = current_user.posts.build(post_params)
   @topic = Topic.find(params[:topic_id])

   @post.topic = @topic

   if @post.save!
     flash[:notice] = "Post was saved."
     redirect_to [@topic, @post]
   else
     flash.now[:alert] = "There was an error saving the post. Please try again."
     render :new
   end
  end

  def update
    @post = current_user.posts.build(post_params)
    @topic = Topic.find(params[:topic_id])
    @post.assign_attributes(post_params)

    @post.topic = @topic

   if @post.save!
     flash[:notice] = "Post was updated."
     redirect_to [@topic, @post]
   else
     flash.now[:alert] = "There was an error saving the post. Please try again."
     render :edit
   end
  end

   def destroy
     @post = Post.find(params[:id])

     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @post.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end

   private

   def post_params
     params.require(:post).permit(:title, :body, :image_url)
   end

end
