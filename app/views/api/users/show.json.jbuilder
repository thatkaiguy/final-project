json.extract! @user,
  :id, :email, :created_at, :fname, :lname, :phone1, :phone2, :location

json.booked_activities do
  json.array! @user.booked_activity_links do |booked_activity_link|
    json.extract! booked_activity_link, :party_size, :date, :activity
  end
end
