class Course < ApplicationRecord
  has_many :course_recipes, dependent: :destroy
  has_many :recipes, :through => :course_recipes, dependent: :destroy
end
