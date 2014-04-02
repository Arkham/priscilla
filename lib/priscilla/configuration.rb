module Priscilla
  class Configuration
    DEFAULT_WIDTH = 80
    DEFAULT_DECORATOR = ':dancer: '
    DEFAULT_OUTPUTTER = ->(s) { puts s }

    attr_accessor :width, :decorator, :outputter

    def initialize
      self.width = DEFAULT_WIDTH
      self.decorator = DEFAULT_DECORATOR
      self.outputter = DEFAULT_OUTPUTTER
    end

    def decorator=(value)
      @decorator = emojify(value)
    end

  private

    def emojify(value)
      value = ":#{value}: " if value.is_a? Symbol
      SimpleEmoji.convert(value)
    end
  end
end
