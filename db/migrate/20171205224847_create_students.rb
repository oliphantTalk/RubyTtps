class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, limit: 30
      t.string :surname, limit: 30
      t.integer :dni
      t.integer :legajo
      t.string :email

      t.timestamps
    end
    add_index :students, :dni, unique: true
    add_index :students, :email, unique: true
  end
end
