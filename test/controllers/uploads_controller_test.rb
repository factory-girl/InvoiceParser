require "test_helper"

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", invoice: test_pdf }
    assert_response :success
  end

  test "should save the email" do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", invoice: test_pdf }
    assert_equal "mckaylacreilly@gmail.com", Upload.last.email
  end

  test "should create a document with an upload_id" do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", invoice: test_pdf }
    assert_equal Document.last.upload_id, Upload.last.id
  end
end
