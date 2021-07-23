class CreateArtefatos < ActiveRecord::Migration[6.1]
  def change
    create_table :artefatos do |t|
      t.string :texto

      t.timestamps
    end
  end
end
