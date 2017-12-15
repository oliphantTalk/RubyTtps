class AddNumberOfEvaluationToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :number_of_evaluation, :integer, default: 3
  end
end
