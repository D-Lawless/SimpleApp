class Eventpost < ApplicationRecord

  belongs_to :event
  belongs_to :user
  has_many :comments


end
