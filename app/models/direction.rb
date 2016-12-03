class Direction < ApplicationRecord
  belongs_to :recipe

  # has_attached_file :image, styles: { med: "400x400>", thumb: "100x100>"  }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
