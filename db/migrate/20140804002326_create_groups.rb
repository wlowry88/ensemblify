class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :type, index: true
      t.boolean :complete
      t.integer :admin

      t.timestamps
    end
  end
end
