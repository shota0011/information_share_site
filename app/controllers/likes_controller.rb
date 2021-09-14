class LikesController < ApplicationController
  before_action :set_like, only: %i[create destroy]

  def create
    current_user.likes.create!(document_id: @document.id)
  end

  def destroy
    current_user.likes.find_by(document_id: @document.id).destroy!
  end

  private

  def set_like
    @document = Document.find(params[:document_id])
  end

end
