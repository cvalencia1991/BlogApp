# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::Discourse::OnlyTopLevelMultisiteSpecs, :config do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new
  end

  it "raises an offense if multisite config option is used in a sub-describe" do
    inspect_source(<<~RUBY)
      describe "test" do
        describe "sub-test", type: :multisite do
        end
      end
    RUBY

    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "raises an offense if multisite config option is used in a sub-describe (RSpec const version)" do
    inspect_source(<<~RUBY)
      RSpec.describe "test" do
        RSpec.describe "sub-test", type: :multisite do
        end
      end
    RUBY

    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "raises an offense if multisite config option is used in an example" do
    inspect_source(<<~RUBY)
      describe "test" do
        it "acts as an example" do
        end

        it "does a thing", type: :multisite do
        end
      end
    RUBY

    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "raises an offense if multisite config option is used in a context" do
    inspect_source(<<~RUBY)
      describe "test" do
        context "special circumstances", type: :multisite do
        end
      end
    RUBY

    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "does not raise an offense if multisite config option is used on top-level describe" do
    inspect_source(<<~RUBY)
      describe "test", type: :multisite do
        describe "sub-test" do
        end
      end
    RUBY

    expect(cop.offenses).to eq([])
  end

  it "does not raise an offense if multisite config option is used on top-level describe (RSpec const version)" do
    inspect_source(<<~RUBY)
      require "rails_helper"

      RSpec.describe "test", type: :multisite do
        describe "sub-test" do
        end
      end
    RUBY

    expect(cop.offenses).to eq([])
  end
end
