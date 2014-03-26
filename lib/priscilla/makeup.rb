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
        decorated_line,
        decorate_message(message),
        decorated_line
      ].join("\n")
    end

  private

    def decorator_length
      @decorator_length ||= decorator.uncolorize.length
    end

    def decoratable_width
      (width / decorator_length) * decorator_length
    end

    def decorated_line
      decorator * (decoratable_width / decorator_length)
    end

    def decoratable?(message)
      minimum_decorated_length(message) <= decoratable_width
    end

    def minimum_decorated_length(message)
      # add two decorators and two wrapping spaces
      message.length + (decorator_length * 2) + 2
    end

    def message_template(message)
      padding = space_for(decoratable_width - minimum_decorated_length(message))
      "#{decorator} #{message} #{padding}#{decorator}"
    end

    def space_for(times)
      ' ' * times
    end

    def decorate_message(message)
      return message unless decoratable?(message)
      message_template(message)
    end
  end
end
