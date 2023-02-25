# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::Discourse::TimeEqMatcher, :config do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new
  end

  it "raises an offense if a timestamp is compared using `eq`" do
    inspect_source(<<~RUBY)
    expect(user.created_at).to eq(Time.zone.now)
    RUBY

    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "passes if a timestamp is compared using `eq_time`" do
    inspect_source(<<~RUBY)
      expect(user.created_at).to eq_time(Time.zone.now)
    RUBY

    expect(cop.offenses).to be_empty
  end
end
