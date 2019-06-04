class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
before_action :set_post, only: [:edit,:update,:destroy]


   def new
     @post = Post.new
   end
   def create
     @post = Post.new(post_params)
     if @post.save
       redirect_to @post, success: 'Лінк успішно створено'
     else
       render :new, danger: 'Лінк не створено'
   end
end
def edit
  @post =Post.find(params[:id])

end

def update
  if @post.update_attributes(post_params)
    redirect_to  @post, success: 'Лінк успішно обновлений'
  else
    render :edit, danger: 'Лінк не обновлений'
  end
end
def destroy
  @post =Post.find(params[:id])
@post.destroy
redirect_to posts_path, success: 'Лінк успішно видалено'
end
   private
def set_post
  @post =Post.find(params[:id])

end
   def post_params
     params.require(:post).permit(:title,:summary,:body,:image, :all_tags)
   end
end
