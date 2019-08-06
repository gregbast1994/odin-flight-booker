
5.times do
    code = Faker::Address.unique.country_code
    Airport.create!(name: Faker::App.unique.name + ' Airport',
                    code: code,
                    country: Faker::Address.country_by_code(code: code) )

end

Airport.find_each do |from|
    5.times do |day|
        Airport.where.not(id: from.id).find_each do |to|
            from.book(to, day.days.from_now)
        end
    end
end
