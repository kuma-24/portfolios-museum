class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title,                null: false, default: ""
      t.text :catchphrase,            null: false
      t.text :servis_content,         null: false 
      t.text :evelopment_background,  null: false
      t.string :thumbnail_img,        null: false, default: ""
      t.references :user,             null: false, foreign_key: true
      t.datetime :created_at,         null: false
      t.datetime :updated_at,         null: false
    end
  end
end
