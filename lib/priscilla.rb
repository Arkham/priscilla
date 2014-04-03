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
    config = Priscilla.configuration
    message = Priscilla::Makeup.new(config).decorate(message, options)
    config.presenter.call(message)
  end
end
