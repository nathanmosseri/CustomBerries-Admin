Product.destroy_all()

puts '🍪Baking Cookies🍪'
Product.create!(name: 'chocolate chip', description: 'half dipped mini chocolate chip cookies', price: 30, box_count: 45)
Product.create!(name: 'oatmeal raisin', description: 'mini oatmeal rasin cookies', price: 25, box_count: 45)
Product.create!(name: 'sprinkle', description: 'mini sprinkle cookies', price: 25, box_count: 45)
puts 'Cookies Done'