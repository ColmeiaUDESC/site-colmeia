class CreateProjetos < ActiveRecord::Migration[6.1]
  def change
    create_table :projetos do |t|
      t.string :titulo
      t.text :desc
      t.string :img_url
      t.string :git_url

      t.timestamps
    end
  end
end
