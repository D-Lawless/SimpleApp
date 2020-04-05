class Comment < ApplicationRecord

  belongs_to :eventpost
  belongs_to :user

end
