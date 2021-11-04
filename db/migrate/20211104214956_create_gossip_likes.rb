class CreateGossipLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :gossip_likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :gossip, index: true
      t.timestamps
    end
  end
end
