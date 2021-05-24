class CreatePostArbitraries < ActiveRecord::Migration[6.1]
  def change
    create_table :post_arbitraries do |t|
      t.text :thumbnail_img
      t.string :site_url
      t.references :post,         null: false, foreign_key: true
      t.datetime :created_at,     null: false
      t.datetime :updated_at,     null: false
    end
  end
end
