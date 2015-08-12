json.array! @addresses do |address|
  json.extract! address, :address1, :address2, :city, :state, :postal_code
end
