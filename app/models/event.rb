class Event < ApplicationRecord

  belongs_to :user
  has_many :eventposts, dependent: :destroy
  has_many :users, through: :eventposts


end
