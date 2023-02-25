# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::Discourse::NoMockingJobs, :config do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new
  end

  it "raises an offense if Jobs is mocked with :enqueue" do
    inspect_source(<<~RUBY)
    Jobs.expects(:enqueue)
    RUBY

    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "raises an offense if Jobs is mocked with :enqueue_in" do
    inspect_source(<<~RUBY)
    Jobs.expects(:enqueue_in)
    RUBY

    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "does not raise an offense if Jobs is not mocked with :enqueue or :enqueue_in" do
    inspect_source(<<~RUBY)
    Jobs.enqueue(:some_job)
    RUBY

    expect(cop.offenses).to eq([])
  end
end
