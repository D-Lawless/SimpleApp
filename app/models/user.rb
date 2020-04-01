class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Destroys profile when user is deleted
  has_one :profile, dependent: :destroy

  has_many :connections, :dependent => :destroy
  has_many :contacts, :through => :connections, :source => :user

  has_many :events
  has_many :comments

end
