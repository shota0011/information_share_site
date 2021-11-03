class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: [:index, :show]
  PER_PAGE = 5

  def index
    @q = Document.ransack(params[:q])
    @documents = @q.result.includes(:user, :likes).order(created_at: :desc).page(params[:page]).per(PER_PAGE)
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

    def after_sign_out_path_for(resource)
      document_path
    end
end
