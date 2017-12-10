class CreateJoinTableEvaluationStudent < ActiveRecord::Migration[5.1]
  def change
    create_join_table :Evaluations, :Students do |t|
       t.index [:evaluation_id, :student_id]
       #t.index [:student_id, :evaluation_id]
       t.date :date
       t.string :instance
       t.string :score, default: "Ausente"

    end
  end
end
