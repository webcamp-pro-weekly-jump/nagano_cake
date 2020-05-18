class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses,  dependent: :destroy

  belongs_to :admins, optional: true


  #退会済みユーザーが閲覧できないようにする
  def active_for_authentication?
    super && (self.is_valid == true)
  end
  
end