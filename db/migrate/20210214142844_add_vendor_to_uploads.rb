class AddVendorToUploads < ActiveRecord::Migration[6.1]
  def change
    add_column :uploads, :vendor, :string
  end
end
