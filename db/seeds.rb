10.times do
    code = Faker::Address.unique.country_code
    Airport.create!(name: Faker::App.unique.name + ' Airport',
                    code: code,
                    country: Faker::Address.country_by_code(code: code) )
end

Airport.find_each do |from|
    Airport.where.not(id: from.id).sample(5).each do |to|
        from.book(to, Faker::Date.forward(20))
    end
end