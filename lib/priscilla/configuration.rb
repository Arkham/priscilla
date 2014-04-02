module Priscilla
  class Configuration
    attr_accessor :width, :decorator, :outputter,
                  :blank_line_before, :blank_line_after

    def initialize
      initialize_defaults
    end

    def decorator=(value)
      @decorator = emojify(value)
    end

  private

    def initialize_defaults
      self.width = 80
      self.decorator = ':dancer: '
      self.outputter = ->(s) { puts s }
      self.blank_line_before = false
      self.blank_line_after = true
    end

    def emojify(value)
      value = ":#{value}: " if value.is_a? Symbol
      SimpleEmoji.convert(value)
    end
  end
end
