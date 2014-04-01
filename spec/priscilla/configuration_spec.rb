# encoding: utf-8
require 'spec_helper'

describe Priscilla do
  describe '::configure' do
    it 'allows to configure options' do
      Priscilla.configure do |c|
        c.width = 5
        c.decorator = '*'
      end

      expect(capture_stdout { pr('∆') }).to eq(
        "*****\n" +
        "* ∆ *\n" +
        "*****\n\n"
      )
    end

    context "emoji" do
      it 'converts decorator symbols to emoji' do
        Priscilla.configure do |c|
          c.width = 8
          c.decorator = :zap
        end

        expect(capture_stdout { pr(':)') }).to eq(
          "⚡ ⚡ ⚡ ⚡ \n" +
          "⚡  :) ⚡ \n" +
          "⚡ ⚡ ⚡ ⚡ \n\n"
        )
      end

      it 'converts emoji within strings' do
        Priscilla.configure do |c|
          c.width = 24
          c.decorator = ':zap: :dancer: :no_good: :frog: '
        end

        expect(capture_stdout { pr("DO IT") }).to eq(
          "⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 \n" +
          "⚡ 💃 🙅 🐸  DO IT  ⚡ 💃 🙅 🐸 \n" +
          "⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 \n\n"
        )
      end
    end
  end
end
