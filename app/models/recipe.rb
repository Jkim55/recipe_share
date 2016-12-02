class Recipe < ApplicationRecord
  acts_as_votable
  belongs_to :user

  has_attached_file :image, styles: { large: "750x750>", thumb: "200x200>"  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, :description, :image, presence: true
end
