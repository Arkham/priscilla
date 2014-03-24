require 'forwardable'

module Priscilla
  class Makeup
    extend Forwardable
    def_delegators :@config, :width, :decorator

    def initialize(config)
      @config = config
    end

    def decorate(message)
      message = message.to_s
      [
        decorator_for(width),
        decorate_message(message),
        decorator_for(width)
      ].join("\n")
    end

  private

    def decorator_for(times)
      decorator * times
    end

    def decoratable?(message)
      minimum_decorated_length(message) <= width
    end

    def minimum_decorated_length(message)
      # add two decorators and two wrapping spaces
      message.length + 4
    end

    def minimum_decorated_message(message)
      "#{decorator} #{message} #{decorator}"
    end

    def decorate_message(message)
      return message unless decoratable?(message)
      minimum_decorated_message(message) + decorator_for(width - minimum_decorated_length(message))
    end
  end
end
