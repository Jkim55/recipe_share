class Category < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :recipes, :through => :categorizations, dependent: :destroy
end
