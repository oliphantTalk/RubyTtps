class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :year
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
