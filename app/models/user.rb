class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image
  attachment :profile_image

  has_many :books, dependent: :destroy
  
  validates :name, uniqueness: true
  validates :name,    length: { in: 2..20 }        # 「2文字以上20文字以下」
  validates :introduction, length: { maximum: 50 }      
  
end
