class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name, limit: 20
      t.string :surname, limit: 20
      t.string :username, limit: 20
      t.string :password
      t.boolean :admin

      t.timestamps
    end
    add_index :teachers, :username, unique: true

  end
end
