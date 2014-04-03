# encoding: utf-8
require 'spec_helper'
require 'ostruct'

module Priscilla
  describe Makeup do
    describe "#decorate" do
      let(:width) { 35 }
      let(:decorator) { "=" }
      let(:config) do
        OpenStruct.new(
          width: width,
          decorator: decorator
        )
      end

      subject do
        described_class.new(config)
      end

      let(:message) { "A cock in a frock on a rock" }
      let(:output) { subject.decorate(message) }

      it "makes a nice header around the message" do
        expect(output).to eq(
          "===================================\n" +
          "= A cock in a frock on a rock     =\n" +
          "===================================\n"
        )
      end

      context "when passed a non-string" do
        let(:width) { 7 }
        let(:message) { 450 }

        it "converts to string and decorates" do
          expect(output).to eq(
            "=======\n" +
            "= 450 =\n" +
            "=======\n"
          )
        end
      end

      context "when message is longer than given width" do
        let(:message) { "My name is Inigo Montoya, you killed my father, prepare to die" }

        it "does not decorate the message" do
          expect(output).to eq(
            "===================================\n" +
            "My name is Inigo Montoya, you killed my father, prepare to die\n" +
            "===================================\n"
          )
        end
      end

      context "when decorator is more than a single character" do
        let(:decorator) { "<>" }

        it "scales the decoration accordingly" do
          expect(output).to eq(
            "<><><><><><><><><><><><><><><><><>\n" +
            "<> A cock in a frock on a rock  <>\n" +
            "<><><><><><><><><><><><><><><><><>\n"
          )
        end
      end

      context "when decorator is a colorized string" do
        let(:decorator) { "[]".blue }

        it "ignores the colors to calculate the total width" do
          expect(output.uncolorize).to eq(
            "[][][][][][][][][][][][][][][][][]\n" +
            "[] A cock in a frock on a rock  []\n" +
            "[][][][][][][][][][][][][][][][][]\n"
          )
        end
      end

      context "when options are passed" do
        it "prefers them over the default configuration" do
          expect(subject.decorate(message, decorator: "€")).to eq(
            "€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€\n" +
            "€ A cock in a frock on a rock     €\n" +
            "€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€\n"
          )
        end

        it "does not override the default configuration" do
          old_config = config
          subject.decorate(message, decorator: "¬_¬")
          expect(old_config.decorator).not_to eq(subject.config.decorator)
        end
      end

      context "when an unicode emoji is passed" do
        let(:decorator) { "⚡ " }

        it "tries to convert it to an unicode emoji" do
          expect(output).to eq(
            "⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ \n" +
            "⚡  A cock in a frock on a rock  ⚡ \n" +
            "⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ ⚡ \n"
          )
        end
      end
    end
  end
end

