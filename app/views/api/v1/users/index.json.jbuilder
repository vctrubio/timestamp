json.array! @users do |user|
  json.extract! user, :id, :name, :username, :email, :profile_photo
  json.link user_path(user)
end
