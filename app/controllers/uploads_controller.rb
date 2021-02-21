class UploadsController < ApplicationController

  def create
    upload = Upload.create({ :email => params[:email], :invoice => params[:invoice] })
    document = Document.create({:upload_id => upload.id})
    render json: document[:id]
  end
end

