class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :instrumentation, index: true
      t.boolean :complete
      t.integer :admin_id

      t.timestamps
    end
  end
end
