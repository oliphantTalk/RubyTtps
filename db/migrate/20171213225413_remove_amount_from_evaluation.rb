class RemoveAmountFromEvaluation < ActiveRecord::Migration[5.1]
  def change
    remove_column :evaluations, :amount, :integer
  end
end
