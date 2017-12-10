class CreateJoinTableCourseStudent < ActiveRecord::Migration[5.1]
  def change
    create_join_table :courses, :students do |t|
       t.index [:course_id, :student_id]
      # t.index [:student_id, :course_id]
      t.string :status

    end
  end
end
