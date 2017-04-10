  json.id @package.id
  json.address @package.address.nil? ? 'Sin Direccion' : @package.address
  json.status @package.order_status.name
  json.status_id @package.order_status_id
  json.bus @package.bus.nil? ? 'Sin bus' : @package.bus.license_plate
