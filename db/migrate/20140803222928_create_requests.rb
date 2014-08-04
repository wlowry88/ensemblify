class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true
      t.references :group, index: true
      t.boolean :user_approved
      t.boolean :group_approved
      t.boolean :finalized, default: nil
      t.string :part

      t.timestamps
    end
  end
end
