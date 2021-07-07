class AddSobrenomeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sobrenome, :string
  end
end
