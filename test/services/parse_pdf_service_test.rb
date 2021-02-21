require "test_helper"

class ParsePdfServiceTest < ActiveSupport::TestCase

  test "should parse vendor" do
    test_pdf = read_file("invoices_HubdocInvoice1.pdf")
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    p __FILE__
    vendor = ParsePdfService.new(test_pdf).run[:vendor]
    assert_equal "Hubdoc Limited Bank House", vendor
  end
end