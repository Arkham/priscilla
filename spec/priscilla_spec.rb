require 'spec_helper'

describe Priscilla do
  describe "::pr" do
    it "adds a method to the Kernel" do
      expect(capture_stdout { pr("hello") }).to match(/hello/)
    end

    it "forwards additional options" do
      expect(capture_stdout { pr("hello", decorator: '<3') }).to match(/hello/)
    end
  end
end
