module Priscilla
  class Configuration
    attr_accessor :width, :decorator, :presenter

    def initialize
      self.width     = 80
      self.decorator = ':dancer: '
      self.presenter = ->(msg) { puts msg; puts }
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
