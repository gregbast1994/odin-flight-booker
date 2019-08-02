10.times do
    code = Faker::Address.unique.country_code
    Airport.create!( code: code,
                     country: Faker::Address.country_by_code(code: code) )
end