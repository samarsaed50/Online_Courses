ActiveAdmin.register Lecture do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :content, :attachment, :user_id, :course_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
form(:html => { :multipart => true }) do |f|
    f.inputs "Lecture Form" do
        f.input :course_id, as: :select, multiple: false, collection: Course.all.collect
        f.input :user_id, as: :select, multiple: false, collection: User.all.collect
        f.input :title
        f.input :content, :as => :ckeditor
        f.input :attachment, :as => :file 
        end
      f.actions
  end
end
