module Priscilla
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
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
