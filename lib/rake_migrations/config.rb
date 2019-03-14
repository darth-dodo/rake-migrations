module RakeMigrations
  class Config
    attr_accessor :database_name, :hostname

    def initialize
      @database_name = nil
      @hostname = nil
    end

    def generate_database_client
      validation_presence_of_connection_attributes

      client = PG.connect(host: hostname,
                          dbname: database_name)
      client
    end

    private

    def validation_presence_of_connection_attributes
      fail "Database name should be provided!" unless @database_name
      fail "Host Name should be provided" unless @hostname
      true
    end

  end


end
end