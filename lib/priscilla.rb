require 'colorize'

require "priscilla/version"
require "priscilla/simple_emoji"
require "priscilla/configuration"
require "priscilla/makeup"

module Kernel
  def pr(message, **options)
    puts Priscilla::Makeup.new(Priscilla.configuration).decorate(message, options)
    puts
  end
end
