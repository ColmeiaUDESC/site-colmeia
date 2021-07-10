class CreateComentarios < ActiveRecord::Migration[6.1]
  def change
    create_table :comentarios do |t|
      t.string :comentario, null: false
      t.references :user, null: false
      t.references :post, null: false
      t.timestamps
    end
  end
end
