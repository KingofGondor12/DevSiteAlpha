json.extract! game, :id, :title, :description, :image_url, :user_id, :created_at, :updated_at
json.url game_url(game, format: :json)
