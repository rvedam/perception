json.extract! perception_user, :id, :name, :email, :password_digest, :created_at, :updated_at
json.url perception_user_url(perception_user, format: :json)