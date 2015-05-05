class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status, default: :incomplete
      t.string :description
      t.date :due_date
      t.boolean :archive, default: true

      t.timestamps null: false
    end
  end
end
