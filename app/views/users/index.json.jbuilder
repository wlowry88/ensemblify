json.array!(@users) do |user|
  json.extract! user, :id, :name, :instrument, :gender, :first_name, :last_name, :short_bio, :image, :email, :zipcode, :phone_number, :instrument, :level, :video_sample, :audio_sample, :type_preferences, :style_preferences, :availability
  json.url user_url(user, format: :json)
end
