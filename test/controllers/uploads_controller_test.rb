require "test_helper"

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test "show create upload" do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", file: file }
    assert_response :success
  end

  test "should save the email" do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", file: file }
    assert_equal "mckaylacreilly@gmail.com", Upload.last.email
  end

  test "should parse PDF" do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", file: file }
    assert_equal "Hubdoc Limited Bank House", Upload.last.vendor
  end
end
