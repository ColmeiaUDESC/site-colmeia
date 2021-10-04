class AddCodigoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :codigo, :string
  end
end
