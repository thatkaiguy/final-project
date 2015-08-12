json.extract! @activity, :id, :title, :description, :img_url, :capacity
# TODO extract properties from associations

json.reviews @activity.reviews do |review|
  json.extract! review, :id, :author_id, :num_stars, :body, :activity_id
end
