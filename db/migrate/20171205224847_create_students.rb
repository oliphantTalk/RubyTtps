class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, limit: 30, null: false
      t.string :surname, limit: 30, null: false
      t.integer :dni, null: false
      t.integer :legajo, null: false
      t.string :email, null: false

      t.timestamps
    end
    add_index :students, :dni, unique: true
    add_index :students, :email, unique: true
  end
end
