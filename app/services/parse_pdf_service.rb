require 'doc_ripper'

class ParsePdfService
  def initialize(file_path)
    @file_path = file_path
  end

  def run
    data = DocRipper::rip(@file_path).encode("UTF-8", "Windows-1252").split("\n")
    { vendor: data[4].split(",")[0] }
  end
end