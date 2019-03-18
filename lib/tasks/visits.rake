# frozen_string_literal: true

namespace :visits do

  desc 'Execute this task to get a formatted output about the global percentage of visits by country'
  task analyze: :environment do
    visits_amount = Visit.count
    visits_by_country = Country.joins('LEFT OUTER JOIN visits ON visits.country_id = countries.id')
                               .group('countries.name')
                               .count('visits.id')
    rows = visits_by_country.sort_by { |_k, v| v }.reverse.each_with_object([]) do |(country, visits), temp|
      temp.push([country, "#{(visits.to_f * 100 / visits_amount).round(2)}%"])
    end
    table = Terminal::Table.new(headings: ['Country', 'Visits percentage'],
                                rows: rows)
    puts table
  end

end
