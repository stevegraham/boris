require 'active_support/inflector'
require 'httparty'

module Boris
  class BusStop
    ENDPOINT = 'http://countdown.tfl.gov.uk/stopBoard/'.freeze

    class << self
      alias find new
    end

    def initialize id
      @id = id
      reload!
    end

    def reload!
      response = HTTParty.get ENDPOINT + @id.to_s
      @properties = deep_underscore_keys response.parsed_response
      self
    end

    private

    def deep_underscore_keys obj
      case obj
      when Array
        obj.map { |obj| deep_underscore_keys obj }
      when Hash
        obj = obj.map do |k,v|
          k = ActiveSupport::Inflector.underscore(k).to_sym
          v = deep_underscore_keys v

          [k, v]
        end

        Hash[obj]
      else
        obj
      end
    end

    def method_missing method, *arguments, &block
      if @properties.has_key? method
        singleton_class.class_eval do
          define_method(method) { @properties[method] }
        end
        send method
      else
        super
      end
    end

  end
end
