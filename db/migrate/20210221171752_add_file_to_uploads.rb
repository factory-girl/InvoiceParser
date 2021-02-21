class AddFileToUploads < ActiveRecord::Migration[6.1]
  def change
    add_column :uploads, :file, :string
  end
end
