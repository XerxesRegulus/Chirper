class CreateMagandas < ActiveRecord::Migration
  def change
    create_table :magandas do |t|
      t.string :title
      t.text :content
      t.timestamps null: false
    end
  end
end
