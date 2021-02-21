class AddInvoiceToUploads < ActiveRecord::Migration[6.1]
  def change
    add_column :uploads, :invoice, :string
  end
end