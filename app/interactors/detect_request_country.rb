# frozen_string_literal: true

class DetectRequestCountry < BaseInteractor

  # request : Request

  def call
    country_name = 'Unknown'
    begin
      ip = context.request.remote_ip
      countries_db ||= MaxMind::DB.new("#{Rails.root}/db/GeoLite2-Country.mmdb", mode: MaxMind::DB::MODE_MEMORY)
      unless localhost?(ip)
        reader = countries_db.get(ip)
        country_name = reader['country']['names']['en'] || 'Unknown'
      end
    ensure
      countries_db.close
    end
    country = Country.find_or_create_by(name: country_name)
    context.country = country
  end

  private

  def localhost?(ip_address)
    %w[127:0:0:1 ::1].include? ip_address
  end

end