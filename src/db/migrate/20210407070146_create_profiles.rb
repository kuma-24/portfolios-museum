class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :avatar_img,       default: ""
      t.text :self_introduction
      t.text :industry
      t.references :user,         null: false, foreign_key: true 
      t.datetime :created_at,     null: false
      t.datetime :updated_at,     null: false
    end
  end
end
