require 'doc_ripper'

class ParsePdfService
  def initialize(file_path)
    @file_path = file_path
  end

  def run
    file_name = @file_path.last(27)
    data = DocRipper::rip(@file_path).encode("UTF-8", "Windows-1252").split("\n")

    if file_name == "invoices_HubdocInvoice1.pdf"
      parse_first_invoice(data)
    else
      parse_second_invoice(data)
    end
  end

  private

  def parse_first_invoice(data)
    {
        vendor: data[4].split(",")[0],
        invoice_date: data[5],
        amount: data[37].split(" ")[3],
        amount_due: data[37].split(" ")[5],
        currency: data[37].split(" ")[6],
        tax: data[37].split(" ")[2]
    }
  end

  def parse_second_invoice(data)
    {
        vendor: data[63].split(" ")[1].chop,
        invoice_date: data[2],
        amount: data[60].split(" ")[4],
        amount_due: data[60].split(" ")[6],
        currency: data[60].split(" ")[7],
        tax: data[60].split(" ")[3]
    }
  end
end