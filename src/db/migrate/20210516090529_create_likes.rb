class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user,         null: false, foreign_key: true
      t.references :post,         null: false, foreign_key: true
      t.datetime :created_at,     null: false
      t.datetime :updated_at,     null: false
    end
  end
end
