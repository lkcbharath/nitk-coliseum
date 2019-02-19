class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # validates :team_name, presence: true

  # validates :name_1, presence: true
  # validates :roll_1, presence: true
  # validates :contact_1, presence: true

  # validates :name_2, presence: true
  # validates :roll_2, presence: true
  # validates :contact_2, presence: true

  # validates :name_3, presence: true
  # validates :roll_3, presence: true
  # validates :contact_3, presence: true

  # validates :name_4, presence: true
  # validates :roll_4, presence: true
  # validates :contact_4, presence: true
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :team_details
  has_many :responses
  has_and_belongs_to_many :questions
end
