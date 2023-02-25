# frozen_string_literal: true

module RuboCop
  module Cop
    module Discourse
      # Use `type: :multisite` only on a top-level `describe`.
      # Mixing multisite and standard specs can lead to errors,
      # e.g. when using `fab!` helper.
      #
      # @example
      #   # bad
      #   describe "something" do
      #     describe "x", type: :multisite do
      #     end
      #
      #     it "does X", type: :multisite do
      #     end
      #   end
      #
      #   # good
      #   describe "something", type: :multisite do
      #     describe "x" do
      #     end
      #
      #     it "does X" do
      #     end
      #   end
      class OnlyTopLevelMultisiteSpecs < Cop
        MSG = "Use `type: :multisite` only on a top-level `describe`"

        def on_block(node)
          return if top_level?(node)
          return if !multisite_describe?(node.children.first)

          add_offense(node, message: MSG)
        end

        private

        def_node_matcher :multisite_describe?, <<~MATCHER
          (send
            {nil? (const nil? :RSpec)}
            {:describe :context :it}
            _
            (hash (pair (sym :type) (sym :multisite)) ...)
          )
        MATCHER

        def top_level?(node)
          if node.parent&.begin_type?
            node.parent.root?
          else
            node.root?
          end
        end
      end
    end
  end
end
