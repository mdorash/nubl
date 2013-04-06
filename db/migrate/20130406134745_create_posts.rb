class CreatePosts < ActiveRecord::Migration

    def change
      create_table :posts do |t|
        t.column :post_id, :integer
        t.column :user_id, :integer
        t.column :rating, :integer
        t.column :title, :string
        t.column :url, :string
        t.column :text, :string

        t.timestamps
      end
    end
  end

