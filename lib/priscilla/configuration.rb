module Priscilla
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    DEFAULT_WIDTH = 80
    DEFAULT_DECORATOR = "⚡ "

    attr_accessor :width, :decorator

    def initialize
      @width = DEFAULT_WIDTH
      @decorator = DEFAULT_DECORATOR
    end

    def decorator=(value)
      @decorator = if value.is_a? Symbol
        SimpleEmoji.convert(value.to_s)
      else
        value
      end
    end
  end
end
