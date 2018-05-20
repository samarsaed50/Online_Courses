class User < ApplicationRecord
 acts_as_voter  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :courses 
has_many :lectures 
has_many :comments        
enum gender: { male: 0, female:1}  
mount_uploader :profilepc, ProfilepcUploader 
validates_presence_of :profilepc 
validates_integrity_of  :profilepc
validates_processing_of :profilepc

private
  def profilepc_size_validation
    errors[:profilepc] << "should be less than 500KB" if profilepc.size > 0.5.megabytes
  end   
end
