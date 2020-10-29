class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :remember_token
  has_many :books
  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, presence: true, length: { maximum: 50 }
  attachment :profile_image
end