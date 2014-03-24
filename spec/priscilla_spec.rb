require 'spec_helper'

describe Priscilla do
  describe "::pr" do
    before do
      class Priscilla::Makeup
        def decorate(msg); msg; end
      end
    end

    it "adds a method to the Kernel" do
      expect(capture_stdout { pr("hello") }).to eq("hello\n")
    end
  end
end
