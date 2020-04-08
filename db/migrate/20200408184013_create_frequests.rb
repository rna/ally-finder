class CreateFrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :frequests do |t|
      t.references :user, foreign_key: true, index: true
      t.references :friend, index: true
      t.boolean :status

      t.timestamps null: false
    end
    add_foreign_key :frequests, :users, column: :friend_id
  end
end
