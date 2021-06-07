class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user,         null: false, foreign_key: true
      t.references :post,         null: false, foreign_key: true
      t.string :comment_content,  null: false
      t.datetime :created_at,     null: false
      t.datetime :updated_at,     null: false
    end
  end
end
