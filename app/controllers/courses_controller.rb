class CoursesController < InheritedResources::Base
  before_action :auth_user, only: [:edit, :update, :destroy]

  def auth_user
    @course = Course.find(params[:id])
    if @course.user_id != current_user.id
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/422", :layout => false, :status => :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
      end
    end
end
def create
  @course=Course.new(course_params)
  @course.user_id = current_user.id
  respond_to do |format|
    if @course.save
      format.html { redirect_to @course }
      format.json { render :show, status: :created, location: @course }
    else
      format.html { render :new }
      format.json { render json: @course.errors, status: :unprocessable_entity }
    end
end
end
  private

    def course_params
      params.require(:course).permit(:title, :user_id)
    end
end

