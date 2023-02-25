# frozen_string_literal: true

module RuboCop
  module Cop
    module Discourse
      # Use `type: :multisite` example setting instead of modifying `Rails.configuration.multisite`.
      #
      # @example
      #   # bad
      #   it "works" do
      #     Rails.configuration.multisite = true
      #     do_something
      #   end
      #
      #   # good
      #   it "works", type: :multisite do
      #     do_something
      #   end
      class NoDirectMultisiteManipulation < Cop
        MSG = "Use `type: :multisite` example setting instead of modifying `Rails.configuration.multisite`."

        def_node_matcher :multisite_setter?, <<-MATCHER
          (send
            (send
              (const nil? :Rails) :configuration) :multisite=
            _)
        MATCHER

        def on_send(node)
          return unless multisite_setter?(node)

          add_offense(node, message: MSG)
        end
      end
    end
  end
end
