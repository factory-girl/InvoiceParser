class AddColumnsToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :upload_id, :integer
    add_column :documents, :vendor, :string
    add_column :documents, :invoice_date, :string
    add_column :documents, :amount, :string
    add_column :documents, :amount_due, :string
    add_column :documents, :currency, :string
    add_column :documents, :tax, :string
  end
end
