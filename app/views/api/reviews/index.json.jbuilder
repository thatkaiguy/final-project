json.array! @reviews do |review|
  json.extract! review, :id, :author_id, :num_stars, :body, :activity_id
end
