class ResetAllDocumentCacheCounters < ActiveRecord::Migration[6.1]
  def up
    Document.find_each { |document| Document.reset_counters(document.id, :likes_count) }
  end

  def down
  end
end
