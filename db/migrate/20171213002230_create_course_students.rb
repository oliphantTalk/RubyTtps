class CreateCourseStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :course_students do |t|
      t.references :course, foreign_key: true
      t.references :student, foreign_key: true
      t.string :status, default: 'En curso'

      t.timestamps
    end
  end
end
