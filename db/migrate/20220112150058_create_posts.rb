class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      
      t.timestamps
    end

    add_reference :posts, :thread, foreign_key: true 

  end
end
