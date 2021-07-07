class AddCamposToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :desc, :string
    add_column :users, :github_username, :string
    add_column :users, :twitter_username, :string
    add_column :users, :instagram_username, :string
    add_column :users, :discord_username, :string
    add_column :users, :imagem_url, :string
    remove_column :users, :situacao
    add_column :users, :situacao, :string, null: false, default: 'Visitante'

  end
end
