class CreateJoinTablePostsTags < ActiveRecord::Migration[6.1]
  def change
    create_join_table :posts, :tags, id: true do |t|
      t.bigint :id, primary_key: true
      # t.index [:post_id, :tag_id]
      # t.index [:tag_id, :post_id]
    end
  end
end
