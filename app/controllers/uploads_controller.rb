class UploadsController < ApplicationController

  def create
    # uploaded_io = params[:file]
    # @file = Rails.root.join('public', uploaded_io.original_filename).to_s
    @upload = Upload.create({ :email => params[:email], :file => params[:file] })

    # @upload.file.attach(params[:file])
  end

  private

  def parse_file
    ParsePdfService.new(params[:file]).run
  end
end
