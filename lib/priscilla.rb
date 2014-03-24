require 'colorize'

require "priscilla/version"
require "priscilla/configuration"
require "priscilla/makeup"

module Kernel
  def pr(message)
    puts Priscilla::Makeup.new(Priscilla.configuration).decorate(message)
    puts
  end
end
