class LikesController < ApplicationController

  def create
    current_user.likes.create!(document_id: params[:document_id])
    @document = Document.find(params[:document_id])
  end

  def destroy
    current_user.likes.find_by(document_id: params[:document_id]).destroy!
    @document = Document.find(params[:document_id])
  end

end
