require "test_helper"

class UploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    test_pdf = Rails.root.join "test/fixtures/files/invoices_HubdocInvoice1.pdf"
    post uploads_path, params: { email: "mckaylacreilly@gmail.com", invoice: test_pdf }
  end

  test "creates successfully and saves the email and document upload_id" do
    assert_response :success
    assert_equal "mckaylacreilly@gmail.com", Upload.last.email
    assert_equal Document.last.upload_id, Upload.last.id
  end
end
