class CreateEvaluationStudents < ActiveRecord::Migration[5.1]
  def change
    drop_join_table :evaluations, :students, table_name: 'evaluation_students'

    create_table :evaluation_students do |t|
        #t.references :course, foreign_key: true
        #t.references :student, foreign_key: true
        t.belongs_to :evaluation, index:true
        t.belongs_to :student, index:true
        t.date :date
        t.string :instance
        t.string :score, default: "Ausente"

        t.timestamps
    end
  end
end
