class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :user, index: true
      t.references :type, index: true

      t.timestamps
    end
  end
end
