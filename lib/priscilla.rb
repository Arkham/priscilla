require "priscilla/version"
require "priscilla/makeup"

module Priscilla
  DEFAULT_WIDTH = 80
  DEFAULT_DECORATOR = "="
end

module Kernel
  def pr(message)
    puts Priscilla::Makeup.new.decorate(message)
  end
end
