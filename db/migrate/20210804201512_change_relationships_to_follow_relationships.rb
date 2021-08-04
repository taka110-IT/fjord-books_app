# frozen_string_literal: true

class ChangeRelationshipsToFollowRelationships < ActiveRecord::Migration[6.1]
  def change
    rename_table :relationships, :follow_relationships
    rename_index :follow_relationships, 'index_relationships_on_follower_id', 'index_follow_relationships_on_follower_id'
    rename_index :follow_relationships, 'index_relationships_on_following_id_and_follower_id', 'index_follow_relationships_on_following_id_and_follower_id'
    rename_index :follow_relationships, 'index_relationships_on_following_id', 'index_follow_relationships_on_following_id'
  end
end
