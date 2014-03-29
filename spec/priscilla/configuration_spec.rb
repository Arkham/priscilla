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

    it 'converts decorator symbols to emoji' do
      Priscilla.configure do |c|
        c.width = 8
        c.decorator = :high_voltage_sign
      end

      expect(capture_stdout { pr(':)') }).to eq(
        "⚡ ⚡ ⚡ ⚡ \n" +
        "⚡  :) ⚡ \n" +
        "⚡ ⚡ ⚡ ⚡ \n\n"
      )
    end
  end
end
