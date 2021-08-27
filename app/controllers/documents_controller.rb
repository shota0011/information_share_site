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
    document = current_user.documents.create!(document_params)
    redirect_to document, notice: "投稿しました"
  end

  def edit
  end

  def update
    @document.update!(document_params)
    redirect_to @document, notice: "更新しました"
  end

  def destroy
    @document.destroy!
    redirect_to root_path, alert: "削除しました"
  end

  private

    def document_params
      params.require(:document).permit(:title, :body)
    end

    def set_document
      @document = Document.find(params[:id])
    end
end
