class CourseRecipe < ApplicationRecord
  belongs_to :course
  belongs_to :recipe
end
