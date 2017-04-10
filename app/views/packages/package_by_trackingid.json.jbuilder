  json.id @package.id
  json.address @package.address
  json.status @package.order_status.name
  json.status_id @package.order_status_id
  json.bus @package.bus.nil? ? 'Sin bus' : @package.bus.license_plate
