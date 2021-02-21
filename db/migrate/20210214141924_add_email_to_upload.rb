class AddEmailToUpload < ActiveRecord::Migration[6.1]
  def change
    add_column :uploads, :email, :string
  end
end
