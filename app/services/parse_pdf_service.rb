require 'doc_ripper'

class ParsePdfService
  def initialize(file_path)
    @file_path = file_path
  end

  def run
    data = DocRipper::rip(@file_path).encode("UTF-8", "Windows-1252").split("\n")
    {
        vendor: data[4].split(",")[0],
        invoice_date: data[5],
        amount: data[37].split(" ")[3],
        amount_due: data[37].split(" ")[5],
        currency: data[37].split(" ")[6],
        tax: data[37].split(" ")[2]
    }
  end
end