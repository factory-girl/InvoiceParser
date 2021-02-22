require "test_helper"

class ParsePdfServiceTest < ActiveSupport::TestCase

  test "should parse vendor" do
    test_pdf = read_file("invoices_HubdocInvoice1.pdf")
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    vendor = ParsePdfService.new(file.path).run[:vendor]
    assert_equal "Hubdoc Limited Bank House", vendor
  end

  test "should parse invoice_date" do
    test_pdf = read_file("invoices_HubdocInvoice1.pdf")
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    invoice_date = ParsePdfService.new(file.path).run[:invoice_date]
    assert_equal "February 22, 2019", invoice_date
  end

  test "should parse amount" do
    test_pdf = read_file("invoices_HubdocInvoice1.pdf")
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    amount = ParsePdfService.new(file.path).run[:amount]
    assert_equal "£22.50", amount
  end

  test "should parse amount_due" do
    test_pdf = read_file("invoices_HubdocInvoice1.pdf")
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    amount_due = ParsePdfService.new(file.path).run[:amount_due]
    assert_equal "£0.00", amount_due
  end

  test "should parse currency" do
    test_pdf = read_file("invoices_HubdocInvoice1.pdf")
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    currency = ParsePdfService.new(file.path).run[:currency]
    assert_equal "GBP", currency
  end

  test "should parse tax" do
    test_pdf = read_file("invoices_HubdocInvoice1.pdf")
    file = Rack::Test::UploadedFile.new(test_pdf, "application/pdf")
    tax = ParsePdfService.new(file.path).run[:tax]
    assert_equal "£0.00", tax
  end
end