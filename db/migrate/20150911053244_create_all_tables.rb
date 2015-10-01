class CreateAllTables < ActiveRecord::Migration
  def change
    create_table :chirps do |t|
      t.integer :user_id
      t.string :content
      t.timestamps null: false
    end

    create_table :notification do |t|
      t.string :notification_type
      t.integer :chirp_id
      t.integer :notifier_user_id
      t.integer :notified_user_id
      t.string :message
      t.timestamps null: false
    end
  end
end
