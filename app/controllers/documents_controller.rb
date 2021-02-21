class DocumentsController < ApplicationController
  def show
    @document = Upload.find(params[:id])
    render json: @document
  end
end
