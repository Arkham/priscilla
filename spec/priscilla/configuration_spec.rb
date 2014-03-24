require 'spec_helper'

describe Priscilla do
  describe "::configure" do
    before do
      Priscilla.configure do |c|
        c.width = 5
        c.decorator = "*"
      end
    end

    it "allows to configure options" do
      expect(capture_stdout { pr("1") }).to eq(
        "*****\n" +
        "* 1 *\n" +
        "*****\n\n"
      )
    end
  end
end
