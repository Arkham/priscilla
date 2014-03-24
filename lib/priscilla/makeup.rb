module Priscilla
  class Makeup
    attr_reader :width, :decorator

    def initialize(width: 80, decorator: "=")
      @width = width
      @decorator = decorator
    end

    def decorate(message)
      message = message.to_s
      [
        only_decorator_line,
        decorate_message(message),
        only_decorator_line
      ].join("\n")
    end

  private

    def only_decorator_line
      decorator * width
    end

    def decorate_message(message)
      return message if message.length > width
      "#{decorator} #{message} ".ljust(width, decorator)
    end
  end
end
