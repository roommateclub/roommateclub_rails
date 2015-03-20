require 'csv'
CSV.foreach("#{Rails.root}/taiwan_districts.csv", headers: false) do |row|
  city_data = row[1][0..2]
  district_data = row[1][3..6].strip
  city = City.find_or_create_by(name: city_data)
  district = city.districts.create(name: district_data)
  puts "#{city.id}-#{city.name}:#{district.city.name}-#{district.name}"
end