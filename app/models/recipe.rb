class Recipe < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { large: "750x750>", thumb: "100x100>"  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
