class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :composer
      t.integer :level
      t.references :instrumentation, index: true
      t.timestamps
    end
  end
end
