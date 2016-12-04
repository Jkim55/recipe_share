class Category < ApplicationRecord
  has_many :category_recipes, dependent: :destroy
  has_many :categories, :through => :category_recipes, dependent: :destroy

end
