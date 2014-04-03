require 'forwardable'

module Priscilla
  class Makeup
    extend Forwardable
    attr_reader :config
    def_delegators :@config, :width, :decorator

    def initialize(config)
      @config = config.clone
    end

    def decorate(message, options = {})
      override_config(options)
      message = message.to_s

      [decorated_line, decorate_message(message), decorated_line]
        .map { |string| string << "\n" }.join
    end

  private

    def decorator_length
      decorator.uncolorize.length
    end

    def decoratable_width
      (width / decorator_length) * decorator_length
    end

    def decorated_line
      decorator * (decoratable_width / decorator_length)
    end

    def decoratable?(message)
      min_decorated_length(message) <= decoratable_width
    end

    def min_decorated_length(message)
      # add two decorators and two wrapping spaces
      message.length + (decorator_length * 2) + 2
    end

    def message_template(message)
      padding = space_for(decoratable_width - min_decorated_length(message))
      "#{decorator} #{message} #{padding}#{decorator}"
    end

    def space_for(times)
      ' ' * times
    end

    def decorate_message(message)
      return message unless decoratable?(message)
      message_template(message)
    end

    def override_config(options)
      options.each do |key, value|
        config.send("#{key}=", value)
      end
    end
  end
end
