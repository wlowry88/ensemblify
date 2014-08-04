class CreateGroupPieces < ActiveRecord::Migration
  def change
    create_table :group_pieces do |t|
      t.references :group, index: true
      t.references :piece, index: true

      t.timestamps
    end
  end
end
