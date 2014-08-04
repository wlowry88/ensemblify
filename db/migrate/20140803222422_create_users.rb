class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :oauth_token
      t.string :oauth_expires_at
      t.string :first_name
      t.string :last_name
      t.string :instrument
      t.string :gender
      t.text :short_bio
      t.string :image
      t.string :email
      t.integer :zipcode
      t.string :phone_number
      t.integer :level
      t.string :video_sample
      t.string :audio_sample
      t.boolean :available

      t.timestamps
    end
  end
end
