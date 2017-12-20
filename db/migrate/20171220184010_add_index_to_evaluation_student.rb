class AddIndexToEvaluationStudent < ActiveRecord::Migration[5.1]
  def change
    add_index :evaluation_students, [:evaluation_id, :student_id], unique: true
  end
end
