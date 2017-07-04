json.partial! partial: 'api/guests/guest', locals: { guest: @guest }

json.gifts do
  json.array! @guest.gifts do |gift|
    json.title gift.title
    json.description gift.description
  end
end
