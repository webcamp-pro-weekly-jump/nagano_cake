class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses,  dependent: :destroy


  belongs_to :admins, optional: true
  validates :email, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :tel, presence: true


  #退会済みユーザーが閲覧できないようにする
  def active_for_authentication?
    super && (self.is_valid == true)
  end
  
end