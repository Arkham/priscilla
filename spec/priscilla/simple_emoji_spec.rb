# encoding: utf-8
require 'spec_helper'

describe SimpleEmoji do
  describe "::convert" do
    let(:emoji) { SimpleEmoji.convert(string) }

    context "when emoji is found" do
      let(:string) { ':zap:' }

      it 'translates a string to an emoji' do
        expect(emoji).to eq("⚡")
      end
    end

    context "when no emoj is found" do
      let(:string) { 'something_completely_different' }

      it 'returns it unchanged' do
        expect(emoji).to eq(string)
      end
    end
  end
end
