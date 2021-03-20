class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :stocks
  has_many :transactions
  
  scope :brokers, -> { where(role: 1)}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  
  before_validation :set_default_role, :set_default_status, :validate_age
  # after_save :send_admin_mail
         
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
    now = Date.today
    before = date_of_birth
    difference_in_days = (now - before).to_i
    if date_of_birth.present? && (difference_in_days/365.25).to_i < 18
      errors.add('You should be over 18 years old to register')
    end
  end

  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    approved? ? super : :not_approved
  end

  def send_admin_mail
    if self.role == :broker
      ApproveBrokerMailer.new_user_waiting_for_approval(email).deliver
    end
  end
  
end
