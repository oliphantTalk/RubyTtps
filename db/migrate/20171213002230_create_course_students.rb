class CreateCourseStudents < ActiveRecord::Migration[5.1]
  def change
      drop_table :course_students do |t|
        t.references :course, foreign_key: true
        t.references :student, foreign_key: true
        t.string :status, default: ''

        t.timestamps
      end
    create_table :course_students do |t|
      #t.references :course, foreign_key: true
      #t.references :student, foreign_key: true
      t.belongs_to :course, index:true
      t.belongs_to :student, index:true
      t.string :status, default: ''

      t.timestamps
    end
    #add_index :course_students, [:course_id, :student_id]
  end
end
