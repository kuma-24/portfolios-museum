class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.text :site_url
      t.text :github_url
      t.references :post,       null: false, foreign_key: true
      t.datetime :created_at,   null: false
      t.datetime :updated_at,   null: false
    end
  end
end
