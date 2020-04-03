class Connection < ApplicationRecord
  
  # belongs_to :user, :foreign_key => :contact_id

  belongs_to :user
  belongs_to :contact, :class_name => "User"
  
  # after_create do |p|
  #   if !Connection.find(:first, :conditions => { :contact_id => p.user_id })
  #     Connection.create!(:user_id => p.contact_id, :contact_id => p.user_id)
  #   end
  # end
  #
  # after_destroy do |p|
  #   reciprocal = Connection.find(:first, :conditions => { :contact_id => p.user_id })
  #   reciprocal.destroy unless reciprocal.nil?
  # end
  #
end
