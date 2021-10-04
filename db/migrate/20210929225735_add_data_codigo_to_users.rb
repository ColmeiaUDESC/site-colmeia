class AddDataCodigoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :data_codigo, :datetime
  end
end
