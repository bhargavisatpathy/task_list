class AddTasklistToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :tasklist, index: true, foreign_key: true
  end
end
