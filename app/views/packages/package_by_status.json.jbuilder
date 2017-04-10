json.packages @packages do |package|
  json.id package.id
  json.trackingid package.trackingid
  json.status package.order_status.name
  json.address package.address
  json.date package.created_at.strftime("%m/%d/%Y")
  #json.date package.created_at.strftime("%l:%M:%S %p")

end