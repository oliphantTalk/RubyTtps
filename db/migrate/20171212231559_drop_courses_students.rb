class DropCoursesStudents < ActiveRecord::Migration[5.1]
  def change
    drop_table :courses_students

  end
end
