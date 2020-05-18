class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
　has_many :addresses,  dependent: :destroy
  has_many :cart_items, dependent: :destroy


  
   
  belongs_to :admins, optional: true

end