class CreateInstrumentInstrumentations < ActiveRecord::Migration
  def change
    create_table :instrument_instrumentations do |t|
      t.references :instrument, index: true
      t.references :instrumentation, index: true

      t.timestamps
    end
  end
end
