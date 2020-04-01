class Profile < ApplicationRecord
  belongs_to :user
  validates :f_name,  presence:true
  validates :l_name,  presence:true
  validates :bio,     presence:true
  validates :role,     presence:true
  validates :user_id, presence:true
end
