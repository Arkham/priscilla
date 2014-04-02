require 'colorize'

require 'priscilla/version'
require 'priscilla/simple_emoji'
require 'priscilla/configuration'
require 'priscilla/makeup'

module Priscilla
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

module Kernel
  def pr(message, options = {})
    Priscilla::Makeup.new(Priscilla.configuration).output(message, options)
  end
end
