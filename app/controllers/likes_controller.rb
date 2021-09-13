class LikesController < ApplicationController

  def create
    current_user.likes.create!(document_id: params[:document_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.likes.find_by(document_id: params[:document_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end
