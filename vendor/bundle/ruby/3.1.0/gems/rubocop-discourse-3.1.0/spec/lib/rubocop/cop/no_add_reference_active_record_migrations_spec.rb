# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::Discourse::NoAddReferenceOrAliasesActiveRecordMigration, :config do
  subject(:cop) { described_class.new(config) }
  let(:config) do
    RuboCop::Config.new
  end

  it "raises an offense if add_reference is used, with or without arguments" do
    inspect_source(<<~RUBY)
      add_reference :posts, :users, foreign_key: true, null: false
    RUBY
    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "raises an offense if add_belongs_to is used, with or without arguments" do
    inspect_source(<<~RUBY)
      add_belongs_to :posts, :users, foreign_key: true, null: false
    RUBY
    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "raises an offense if t.references, or any variable.references is used, with or without arguments" do
    inspect_source(<<~RUBY)
      create_table do |t|
        t.references :topic, null: false
      end
      create_table do |mytable|
        mytable.references :topic, null: false
      end
    RUBY
    expect(cop.offenses.count).to eq(2)
    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end

  it "raises an offense if t.belongs_to, or any variable.belongs_to is used, with or without arguments" do
    inspect_source(<<~RUBY)
      create_table do |t|
        t.belongs_to :topic, null: false
      end
      create_table do |mytable|
        mytable.belongs_to :topic, null: false
      end
    RUBY
    expect(cop.offenses.count).to eq(2)
    expect(cop.offenses.first.message).to eq(described_class::MSG)
  end
end
