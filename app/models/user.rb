class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
         
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true

  before_validation :validate_age

  enum role: [:buyer, :broker]

  def set_default_role
    self.role ||= :buyer
  end

  def validate_age
    now = Date.today
    before = date_of_birth
    difference_in_days = (now - before).to_i
  
    if date_of_birth.present? && (difference_in_days/365.25).to_i <= 18
      errors.add('You should be over 18 years old to register')
    end
  end
  
end
