class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :stocks
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  
  before_validation :set_default_role, :set_default_status, :validate_age
         
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true

  enum role: [:buyer, :broker]

  def set_default_role
    self.role ||= :buyer
  end

  def set_default_status
    if self.role == :buyer
      self.approved = true
    elsif self.role == :broker
      self.approved = false
    end
  end

  def validate_age
    if date_of_birth < 18.years.ago.to_i
      errors.add(:date_of_birth, 'You should be over 18 years old to sign up.')
    end
  end

  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    approved? ? super : :not_approved
  end

  after_save :send_admin_mail
  def send_admin_mail
    ApproveBrokerMailer.new_user_waiting_for_approval(email).deliver
  end
  
end
