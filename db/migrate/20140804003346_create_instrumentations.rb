class CreateInstrumentations < ActiveRecord::Migration
  def change
    create_table :instrumentations do |t|
      t.string :name

      t.timestamps
    end
  end
end
