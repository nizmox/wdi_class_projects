class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :twitter_id
      t.integer :user_id
      t.text :post

      t.timestamps
    end
  end
end
