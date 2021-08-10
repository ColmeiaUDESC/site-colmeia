class CreateSenhas < ActiveRecord::Migration[6.1]
  def change
    create_table :senhas do |t|
      t.string :plataforma
      t.string :link
      t.string :usuario
      t.string :senha

      t.timestamps
    end
  end
end
