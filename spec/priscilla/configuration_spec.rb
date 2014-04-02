# encoding: utf-8
require 'spec_helper'
require 'logger'

describe Priscilla do
  describe '::configure' do
    before do
      Priscilla.configure do |c|
        c.outputter = ->(s) { puts s }
      end
    end

    it 'allows to configure style' do
      Priscilla.configure do |c|
        c.width = 5
        c.decorator = '*'
        c.blank_line_before = false
        c.blank_line_after = true
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

        expect(capture_stdout { pr("DO IT") }).to eq(
          "⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 \n" +
          "⚡ 💃 🙅 🐸  DO IT  ⚡ 💃 🙅 🐸 \n" +
          "⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 ⚡ 💃 🙅 🐸 \n\n"
        )
      end
    end

    it 'allows to use a different outputter' do
      class DummyLogger
        def debug(s)
          s
        end
      end

      Priscilla.configure do |c|
        c.outputter = ->(s) { DummyLogger.new.debug s }
        c.width = 10
      end

      expect(pr('oh hai')).to eq(
        "**********\n" +
        "* oh hai *\n" +
        "**********\n\n"
      )
    end
  end
end
