require 'rumoji'

class SimpleEmoji
  class << self
    def convert(string)
      Rumoji.decode(string)
    end
  end
end
