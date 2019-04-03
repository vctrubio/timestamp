json.array! @events do |event|
  json.extract! event, :title, :description
end
