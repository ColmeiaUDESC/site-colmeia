class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :desc
      t.string :html
      t.string :users_name

      t.timestamps
    end
  end
end
