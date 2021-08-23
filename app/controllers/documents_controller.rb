class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show edit update destroy]

  def index
    @documents = Document.order(created_at: :asc)
  end

  def show
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
    @document.update!
    redirect_to root_path
  end

  def destroy
    @document.destroy!
    redirect_to root_path
  end

  private

  def document_params
    params.require(:document).permit(:title, :body)
  end

  def set_document
    @document = Document.find(params[:id])
  end
