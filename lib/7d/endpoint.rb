module SevenDigital
  class Endpoint
    def self.host(host=nil)
      if host
        @host = host
      else
        @host || 'api.7digital.com'
      end
    end

    def self.path(path=nil)
      if path
        @path = path
      else
        @path
      end
    end

    def self.name(name=nil)
      if name
        @name = name
      else
        @name
      end
    end

    def self.protection(protection=nil)
      if protection
        @protection = protection
      else
        @protection
      end
    end

    def self.parameters
      @parameters ||= {}
    end

    def self.parameter(name, description, options={})
      @parameters ||= {}
      @parameters[name] = { description: description, options: options }
    end

    def self.build_request(arguments={})
      arguments.reject! { |a| !parameters.include?(a) }
      required = parameters.each_value { |v| v[:options][:required] == true }

      required.each_key do |k|
        fail ArgumentError unless arguments.include?(k)
      end

      {
        uri: format("https://#{host}#{path}", arguments),
        parameters: arguments,
        protection: protection
      }
    end
  end
end
