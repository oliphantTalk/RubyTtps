class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :year, limit: 5
      t.text :detail

      t.timestamps
    end
    add_index :subjects, :name, unique: true

  end
end
