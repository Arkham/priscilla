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

    context 'emoji' do
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

        expect(capture_stdout { pr('DO IT') }).to eq(
          "⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 \n" +
          "⚡ 💃 🙅 🐸  DO IT  ⚡ 💃 🙅 🐸 \n" +
          "⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 \n\n"
        )
      end
    end

    context 'presenter' do
      it 'allows a custom presenter method' do
        Priscilla.configure do |c|
          c.width = 14
          c.decorator = '°'
          c.presenter = lambda do |msg|
            puts 'ABBA ABBA ABBA'
            puts msg
            puts 'ABBA ABBA ABBA'
          end
        end

        expect(capture_stdout { pr('MAMMA MIA') }).to eq(
          "ABBA ABBA ABBA\n" +
          "°°°°°°°°°°°°°°\n" +
          "° MAMMA MIA  °\n" +
          "°°°°°°°°°°°°°°\n" +
          "ABBA ABBA ABBA\n"
        )
      end
    end
  end
end
