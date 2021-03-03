class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :confirmable
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :date_of_birth, presence: true
        #  validate :validate_age

  enum role: [:buyer, :broker]

  def set_default_role
    self.role ||= :buyer
  end

  # private
  # def validate_age
  #   if date_of_birth.present? && date_of_birth > 18.years.ago.to_s
  #     errors.add('You should be 18 years or older.')
  #   end
  # end

end
