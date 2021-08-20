class DocumentsController < ApplicationController
  def index
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    document = Document.create!(document_params)
    redirect_to document
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def document_params
    params.require(:document).permit(:title, :body)
  end

end
