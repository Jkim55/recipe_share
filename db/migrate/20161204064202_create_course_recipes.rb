class CreateCourseRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :course_recipes do |t|
      t.references :course, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
