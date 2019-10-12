class Address
  include Geokit::Geocoders

  Geokit::Geocoders::GoogleGeocoder.api_key = ENV['GOOGLE_MAPS_KEY']

  def self.geocode(address)
    MultiGeocoder.geocode(address).ll.split(',').collect(&:to_f)
  end
end
