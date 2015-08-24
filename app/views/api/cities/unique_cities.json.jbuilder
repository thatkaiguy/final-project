json.array! @cities do |city|
  json.extract! city, :city, :state
end
