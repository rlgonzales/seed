class UpdateImageAttributesForPaperclipFields < ActiveRecord::Migration
  def self.up
    rename_column :images, :filename, :uploaded_data_file_name
    rename_column :images, :content_type, :uploaded_data_content_type
    rename_column :images, :size, :uploaded_data_file_size
  end

  def self.down
    rename_column :images, :uploaded_data_file_size, :size
    rename_column :images, :uploaded_data_content_type, :content_type
    rename_column :images, :uploaded_data_file_name, :filename
  end
end
