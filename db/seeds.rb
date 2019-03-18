LINKS_TO_BE_CREATED_COUNT = 200
LINKS_DELIMITER  = 100
VISITS_TO_BE_CREATED_COUNT = 1000
VISITS_DELIMITER = 100
COUNTRIES_TO_BE_CREATED_COUNT = 50

puts '== LINKS GENERATION START ==='

LINKS_TO_BE_CREATED_COUNT / LINKS_DELIMITER.times do
  links = []
  LINKS_DELIMITER.times do
    links << Link.new(
      original: FFaker::Internet.http_url + '/' + SecureRandom.hex,
      shortened: Druuid.gen
    )
  end
  Link.import links, validate: false
end

puts '=== LINKS GENERATION FINISH ==='
puts '=== COUNTRIES GENERATION START ==='

countries_names = FFaker::Address::COUNTRY.sample(COUNTRIES_TO_BE_CREATED_COUNT)
countries_names.each do |country_name|
  Country.create(name: country_name)
end

puts '=== COUNTRIES GENERATION FINISH ==='
puts '=== VISITS GENERATION START ==='

VISITS_TO_BE_CREATED_COUNT / VISITS_DELIMITER.times do
  visits = []
  VISITS_DELIMITER.times do
    visits << Visit.new(
      ip: FFaker::Internet.ip_v4_address,
      link_id: rand(1..LINKS_TO_BE_CREATED_COUNT),
      country_id: rand(1..COUNTRIES_TO_BE_CREATED_COUNT)
    )
  end
  Visit.import visits, validate: false
end

puts '=== VISITS GENERATION FINISH ==='
