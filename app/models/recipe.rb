class Recipe < ApplicationRecord
  acts_as_votable
  belongs_to :user

  has_many :ingredients, dependent: :destroy
  has_many :directions, dependent: :destroy

  accepts_nested_attributes_for :ingredients,
                              reject_if: proc { |attributes| attributes['name'].blank? },
                              allow_destroy: true
  accepts_nested_attributes_for :directions,
                              reject_if: proc { |attributes| attributes['step'].blank? },
                              allow_destroy: true

  validates :title, :description, :image, presence: true

  has_attached_file :image, styles: { large: "750x750>", thumb: "200x200>"  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
