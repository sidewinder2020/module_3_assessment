class Store
  attr_reader :long_name, :city, :distance, :phone_number, :store_type

    def initialize(attrs = {})
      @long_name = attrs[:]
      @city = attrs[:]
      @distance = attrs[:]
      @phone_number = attrs[:]
      @store_type = attrs[:]
    end

    #long name, city, distance, phone number and store type
end
