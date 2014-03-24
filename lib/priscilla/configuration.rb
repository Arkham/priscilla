module Priscilla
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    DEFAULT_WIDTH = 80
    DEFAULT_DECORATOR = "=".light_magenta

    attr_accessor :width, :decorator

    def initialize
      @width = DEFAULT_WIDTH
      @decorator = DEFAULT_DECORATOR
    end
  end
end
