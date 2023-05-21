class User < ApplicationRecord
  mount_uploader :profile_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates:name,
    presence:true,
    length:{minimum:2,maximum:20},
    uniqueness:true

  validates:introduction,
    length:{maximum:50}

  has_many :books,dependent: :destroy
  mount_uploader :image, ImageUploader

  def introduction
    self[:introduction]
  end

  def get_profile_image(width, height)
    profile_image.url(:thumb)
  end

  attribute :introduction, :text
  mount_uploader :profile_image,ImageUploader
end
