json.extract! game, :id, :image, :name, :year, :manufacturer, :notes, :is_active
json.url game_url(game, format: :json)
