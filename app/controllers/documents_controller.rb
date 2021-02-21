class DocumentsController < ApplicationController

  def show
    document = Document.find(params[:id])
    upload = Upload.find(document.upload_id)
    document_file_path = upload.invoice
    unless document.vendor
      document_file_path = document_file_path.squeeze
      parsed_pdf = parse_file(document_file_path)
      document.update({
                          :vendor => parsed_pdf[:vendor],
                          :invoice_date => parsed_pdf[:invoice_date],
                          :amount => parsed_pdf[:amount],
                          :amount_due => parsed_pdf[:amount_due],
                          :currency => parsed_pdf[:currency],
                          :tax => parsed_pdf[:tax]
                      })
    end

    render json: document
  end


  private

  def parse_file(file_path)
    ParsePdfService.new(file_path).run
  end
end
