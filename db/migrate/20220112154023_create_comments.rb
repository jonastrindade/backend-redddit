class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment

      t.timestamps
    end

    add_reference :comments, :post, foreign_key: true 

  end
end
