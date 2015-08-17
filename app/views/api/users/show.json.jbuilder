json.extract! @user, :id, :email

json.booked_activities do
  json.array! @user.booked_activity_links do |booked_activity_link|
    json.extract! booked_activity_link, :party_size, :date, :activity
  end
end
