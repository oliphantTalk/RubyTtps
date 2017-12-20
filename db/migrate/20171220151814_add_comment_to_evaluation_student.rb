class AddCommentToEvaluationStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluation_students, :comment, :string
  end
end
