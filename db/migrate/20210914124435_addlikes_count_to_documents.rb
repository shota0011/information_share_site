class AddlikesCountToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :likes_count, :integer, default: 0
  end
end
