class CreateJoinTableMixtapeSong < ActiveRecord::Migration
  def change
    create_join_table :mixtapes, :songs do |t|
      # t.index [:mixtape_id, :song_id]
      # t.index [:song_id, :mixtape_id]
    end
  end
end
