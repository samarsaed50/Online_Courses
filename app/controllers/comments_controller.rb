class CommentsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :auth_user, only: [:edit, :update, :destroy]
  def auth_user
    @comment = Comment.find(params[:id])
    if @comment.user_id != current_user.id 
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/422", :layout => false, :status => :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
      end
    end
end
def create
  @comment=Comment.new(comment_params)
  @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to lecture_url(@comment.lecture_id)
    else
      format.html { render :new }
      format.json { render json: @comment.errors, status: :unprocessable_entity }  
end
end
def index
  respond_to do |format|
    format.html { render :file => "#{Rails.root}/public/422", :layout => false, :status => :not_found }
    format.xml  { head :not_found }
    format.any  { head :not_found }
  end
 end 
 def show
  respond_to do |format|
    format.html { render :file => "#{Rails.root}/public/422", :layout => false, :status => :not_found }
    format.xml  { head :not_found }
    format.any  { head :not_found }
  end
 end 
def new
  @comment = Comment.new
end
  private

    def comment_params
      params.require(:comment).permit(:comment, :user_id, :lecture_id)
    end
end

