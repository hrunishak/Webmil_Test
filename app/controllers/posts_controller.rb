class PostsController < ApplicationController
  before_action :authenticate_user!,except: [:show,:index]
before_action :set_post, only: [:show ]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end
  def show
  end
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


   private
def set_post
  @post =Post.find(params[:id])

end

   def post_params
     params.require(:post).permit(:title,:summary,:body,:image, :all_tags)
   end
end
