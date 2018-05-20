class LecturesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :auth_user, only: [:edit, :update, :destroy]
  def auth_user
    @lecture = Lecture.find(params[:id])
    if @lecture.user_id != current_user.id && @lecture.course.user_id != current_user.id
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/422", :layout => false, :status => :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
      end
    end
end

def index
  respond_to do |format|
    format.html { render :file => "#{Rails.root}/public/422", :layout => false, :status => :not_found }
    format.xml  { head :not_found }
    format.any  { head :not_found }
  end
 end 
 def create
  @lecture=Lecture.new(lecture_params)
  @lecture.user_id = current_user.id
  respond_to do |format|
    if @lecture.save
      format.html { redirect_to @lecture}
      format.json { render :show, status: :created, location: @lecture }
    else
      format.html { render :new }
      format.json { render json: @lecture.errors, status: :unprocessable_entity }
    end
end
end
def new
  @lecture = Lecture.new
end
def like
 @lecture=Lecture.find(params[:id])
 @lecture.liked_by current_user
 redirect_to @lecture
end
def dislike
@lecture=Lecture.find(params[:id])
@lecture.disliked_by current_user
redirect_to @lecture  
end 
def spam
  @lecture=Lecture.find(params[:id])
  @lecture.liked_by current_user, :vote_scope => 'spam'
  redirect_to @lecture
 end
 def unspam
 @lecture=Lecture.find(params[:id])
 @lecture.unliked_by current_user, :vote_scope => 'spam'
 redirect_to @lecture  
 end 
  private
    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment, :user_id, :course_id)
    end
end

