class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.string :text
      t.integer :sub_id
      t.integer :poster_id
      t.timestamps
    end
  end
end
