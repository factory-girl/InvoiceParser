class DocumentsController < ApplicationController

  def show
    document = Document.find(params[:id])
    upload = Upload.find(document.upload_id)
    document_file_path = upload.invoice
    file_name = document_file_path.last(27)
    parse_document(document, document_file_path, file_name)

    render json: document
  end

  private

  def parse_document(document, document_file_path, file_name)
    unless document.vendor
      document_file_path = document_file_path.squeeze
      parsed_pdf = parse_pdf_service(document_file_path)
      document.update({
                          :vendor => parsed_pdf[:vendor],
                          :invoice_date => parsed_pdf[:invoice_date],
                          :amount => parsed_pdf[:amount],
                          :amount_due => parsed_pdf[:amount_due],
                          :currency => parsed_pdf[:currency],
                          :tax => parsed_pdf[:tax]
                      })
      end
  end

  def parse_pdf_service(file_path)
    ParsePdfService.new(file_path).run
  end
end
