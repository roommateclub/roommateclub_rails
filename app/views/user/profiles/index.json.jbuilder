json.array!(@profiles) do |profile|
  json.extract! profile, :id, :nickname, :gender, :birthdate, :user_id
  json.url profile_url(profile, format: :json)
end
