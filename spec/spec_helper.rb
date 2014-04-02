require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'priscilla'

module CaptureHelpers
  def capture_stdout(&block)
    original_stdout = $stdout
    $stdout = fake = StringIO.new
    begin
      yield
    ensure
      $stdout = original_stdout
    end
    fake.string
  end
end

RSpec.configure do |config|
  config.include CaptureHelpers
end
