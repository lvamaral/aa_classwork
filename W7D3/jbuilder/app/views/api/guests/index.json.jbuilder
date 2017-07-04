
@guests = @guests.select { |guest| guest.age <= 50 && guest.age >= 40 }

json.partial! partial: 'api/guests/guest', collection: @guests, as: :guest
