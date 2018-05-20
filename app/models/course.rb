class Course < ApplicationRecord
   belongs_to :user 
   has_many :lectures
   validates :user_id, :presence =>true
   validates :title, :presence =>true
end
