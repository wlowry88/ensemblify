class Addspotifyidtopieces < ActiveRecord::Migration
  def change
  	add_column :pieces, :spotify_id, :string
  end
end
