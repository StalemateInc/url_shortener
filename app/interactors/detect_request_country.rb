# frozen_string_literal: true

class DetectRequestCountry < BaseInteractor

  # request : Request

  def call
    country_name = 'Unknown'
    ip = context.request.remote_ip
    countries_db = MaxMindDB.new("#{Rails.root}/db/GeoLite2-Country.mmdb", MaxMindDB::LOW_MEMORY_FILE_READER)
    unless localhost?(ip)
      reader = countries_db.lookup(ip)
      country_name = reader.country.name || 'Unknown'
    end
    country = Country.find_or_create_by(name: country_name)
    context.country = country
  end

  private

  def localhost?(ip_address)
    %w[127:0:0:1 127.0.0.1 ::1].include? ip_address
  end

end