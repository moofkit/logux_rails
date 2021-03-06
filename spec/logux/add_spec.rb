# frozen_string_literal: true

require 'spec_helper'

describe Logux::Add, timecop: true do
  let(:request) { described_class.new }

  describe '#call' do
    let(:data) { [{ id: 1 }, { id: 2 }] }
    let(:meta) { create(:logux_meta) }
    let(:logux_commands) do
      [['action', { id: 1 }, meta], ['action', { id: 2 }, meta]]
    end

    it 'return processed' do
      expect { request.call(data, meta: meta) }.to(
        send_to_logux(*logux_commands)
      )
    end
  end
end
