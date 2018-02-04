# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

catagories = [
	[1,	'Cookies', 'cookies'],
	[2,	'Cakes', 'cakes'],
	[3,	'Cup Cakes', 'cup-cakes'],
	[4,	'Macarons', 'macarons'],
	[5,	'Small Bites','small-bites']
]

products = [
	[1, 'red', 'red', ' ', 1],
	[2, 'green', 'green', ' ', 2],
	[3, 'blue', 'blue', ' ', 3],
	[4, 'yellow', 'yellow', ' ', 4],
	[5, 'brown', 'brown', ' ', 5],
	[6, 'orange', 'orange', ' ', 1],
	[7, 'purple', 'purple', ' ', 2],
	[8, 'maroon', 'maroon', ' ', 3],
	[9, 'teal', 'teal', ' ', 4],
	[10, 'magenta', 'magenta', ' ', 5],
	[11, 'violet', 'violet', ' ', 1],
	[12, 'turquois', 'turquois', ' ', 2],
	[13, 'emerald', 'emerald', ' ', 3],
	[14, 'tan', 'tan', ' ', 4],
	[15, 'navy', 'navy', ' ', 5]
]

product_variations = [
	[1, 'A001', '12 pack',750, 1],
	[2, 'A002', '12 pack',750, 2],
	[3, 'A003', '12 pack',750, 3],
	[4, 'A004', '12 pack',750, 4],
	[5, 'A005', '12 pack',750, 5],
	[6, 'A006', '12 pack',750, 6],
	[7, 'A007', '12 pack',750, 7],
	[8, 'A008', '12 pack',750, 8],
	[9, 'A009', '12 pack',750, 9],
	[10, 'A0010', '12 pack',750, 10],
	[11, 'A0011', '12 pack',750, 11],
	[12, 'A0012', '12 pack',750, 12],
	[13, 'A0013', '12 pack',750, 13],
	[14, 'A0014', '12 pack',750, 14],
	[15, 'A0015', '12 pack',750, 15],
	[16, 'A0016', '24 pack',1200, 1],
	[17, 'A0017', '24 pack',1200, 2],
	[18, 'A0018', '24 pack',1200, 3],
	[19, 'A0019', '24 pack',1200, 4],
	[20, 'A0020', '24 pack',1200, 5],
	[21, 'A0021', '24 pack',1200, 6],
	[22, 'A0022', '24 pack',1200, 7],
	[23, 'A0023', '24 pack',1200, 8],
	[24, 'A0024', '24 pack',1200, 9],
	[25, 'A0025', '24 pack',1200, 10],
	[26, 'A0026', '24 pack',1200, 11],
	[27, 'A0027', '24 pack',1200, 12],
	[28, 'A0028', '24 pack',1200, 13],
	[29, 'A0029', '24 pack',1200, 14],
	[30, 'A0030', '24 pack',1200, 15]
]

catagories.each do |id, title, slug|
	Catagory.create(:id => id, :title => title, :slug => slug)
end

products.each do |id, title, slug, description, catagory_id|
	Product.create(:id => id, :title => title, :slug => slug, :description => description, :catagory_id => catagory_id)
end

product_variations.each do |id, sku, title, price, product_id|
	ProductVariation.create(:id => id, :sku => sku, :title => title, :price => price, :product_id => product_id)
end
