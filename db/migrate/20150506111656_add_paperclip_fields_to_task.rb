class AddPaperclipFieldsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :attachment_file_name, :string
    add_column :tasks, :attachment_content_type, :string
    add_column :tasks, :attachment_file_size, :integer
    add_column :tasks, :attachment_updated_at, :datetime
  end
end
