json.array! @activities do |activity|
  json.extract! activity, :id, :creator_id, :address_id, :title, :description, :img_url, :capacity
end
