require "test_helper"

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "show" do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", file: file }
    assert_response :success
  end
end