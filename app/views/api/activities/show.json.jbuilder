json.extract! @activity, :id, :title, :description, :img_url,
  :capacity, :price, :img_url_full_size
# TODO extract properties from associations

json.reviews @activity.reviews do |review|
  json.extract! review,
    :id, :author_id, :num_stars, :body, :activity_id, :created_at
  json.author do
    json.extract! review.author, :email
  end
end
