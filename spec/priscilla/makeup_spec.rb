require 'spec_helper'

module Priscilla
  describe Makeup do
    describe "default values" do
      subject { described_class.new }

      it {
        expect(subject.width).to eq(80)
        expect(subject.decorator).to eq("=")
      }
    end

    describe "#decorate" do
      let(:width) { 35 }
      let(:decorator) { "=" }

      subject do
        described_class.new(
          width: width,
          decorator: decorator
        )
      end

      let(:message) { "A cock in a frock on a rock" }
      let(:output) { subject.decorate(message) }

      it "makes a nice header around" do
        expect(output).to eq(
          "===================================\n" +
          "= A cock in a frock on a rock =====\n" +
          "==================================="
        )
      end

      context "when message is longer than given width" do
        let(:message) { "My name is Inigo Montoya, you killed my father, prepare to die" }

        it "does not decorate the message" do
          expect(output).to eq(
            "===================================\n" +
            "My name is Inigo Montoya, you killed my father, prepare to die\n" +
            "==================================="
          )
        end
      end
    end
  end
end

