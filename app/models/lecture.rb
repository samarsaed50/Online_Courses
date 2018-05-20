class Lecture < ApplicationRecord  
mount_uploader :attachment, AttachmentUploader
acts_as_votable 
belongs_to :user 
belongs_to :course
has_many :comments  
validates :title, presence: true
validates :content, presence: true
validates :user_id, presence: true
validates :course_id, presence: true

end
