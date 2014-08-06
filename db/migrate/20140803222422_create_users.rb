class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :oauth_token
      t.string :oauth_expires_at
      t.string :first_name
      t.string :last_name
      t.references :instrument, index: true
      t.string :gender
      t.text :short_bio, default: ""
      t.string :image
      t.string :email
      t.string :zipcode
      t.string :phone_number
      t.string :level
      t.string :video_sample, default: ""
      t.string :audio_sample, default: ""
      t.string :available

      t.timestamps
    end
  end
end
