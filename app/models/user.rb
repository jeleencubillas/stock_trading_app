class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :confirmable

  enum role: [:buyer, :broker]

  def set_default_role
    self.role ||= :buyer
  end

end
