require "test_helper"

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "show" do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", invoice: test_pdf }
    get 'documents', params: { id: Document.last.id }
    assert_response :success
  end
end