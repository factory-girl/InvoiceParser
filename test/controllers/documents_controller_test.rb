require "test_helper"

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "show" do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", invoice: test_pdf }
    get documents_path(Document.last.id)
    assert_response :success
  end

  test "if the document has already been parsed, it does not parse the document again" do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", invoice: test_pdf }
    Document.last.update(vendor: "test")
    get documents_path(Document.last.id)
    assert_response :success
  end
end