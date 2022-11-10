class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    first_name + last_name
  end
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
