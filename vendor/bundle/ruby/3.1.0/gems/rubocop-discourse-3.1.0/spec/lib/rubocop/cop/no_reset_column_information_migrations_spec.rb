# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::Discourse::NoResetColumnInformationInMigrations, :config do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new
  end

  it "raises an offense if reset_column_information is used" do
    inspect_source(<<~RUBY)
      class SomeMigration < ActiveRecord::Migration[6.0]
        def up
          Post.reset_column_information
        end
      end
    RUBY

    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "raise an offense if reset_column_information is used without AR model" do
    inspect_source(<<~RUBY)
      class SomeMigration < ActiveRecord::Migration[6.0]
        def up
          "post".classify.constantize.reset_column_information
        end
      end
    RUBY

    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end
end
