class Store
  attr_reader :long_name, :city, :distance, :phone_number, :store_type

    def initialize(attrs = {})
      @long_name = attrs[:longName]
      @city = attrs[:city]
      @distance = attrs[:distance]
      @phone_number = attrs[:phone]
      @store_type = attrs[:storeType]
    end

    #long name, city, distance, phone number and store type
end
