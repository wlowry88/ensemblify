json.array!(@groups) do |group|
  json.extract! group, :id, :name, :type_id, :complete, :admin
  json.url group_url(group, format: :json)
end
