require 'emoji'

class SimpleEmoji
  class << self

    def convert(string)
      if found = index.find_by_name(string)
        "#{found["moji"]} "
      else
        string
      end
    end

  private

    def index
      @index ||= Emoji::Index.new
    end
  end
end
