module Priscilla
  class Makeup
    attr_reader :width, :decorator

    def initialize(width: 80, decorator: "=")
      @width = width
      @decorator = decorator
    end

    def decorate(message)
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
      " #{message} ".center(width, decorator)
    end

  end
end
