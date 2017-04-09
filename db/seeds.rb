p "El Seed ha comenzado!!!"

p "El seed de ciudades !!!!!"
City.create(code: 05001, name: "MEDELLIN")
City.create(code: 11001, name: "BOGOTA")
City.create(code: 76001, name: "CALI")
City.create(code: 76364, name: "JAMUNDI")
City.create(code: "08001".to_i, name: "BARRANQUILLA")
City.create(code: "08078".to_i, name: "BARANOA")
City.create(code: "08560".to_i, name: "PONEDERA")
p "El seed de ciudades termino"

p "seed de estados!!!!!!"
OrderStatus.create(name:"En Bodega")
OrderStatus.create(name:"En Transporte")
OrderStatus.create(name:"Entregado")
p "seed de estados terminado"
p "El seed a termiado"