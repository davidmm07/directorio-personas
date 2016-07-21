json.array!(@users) do |user|
  json.extract! user, :id, :nombres, :apellidos, :telefonos, :email, :usertype_id
  json.url user_url(user, format: :json)
end
