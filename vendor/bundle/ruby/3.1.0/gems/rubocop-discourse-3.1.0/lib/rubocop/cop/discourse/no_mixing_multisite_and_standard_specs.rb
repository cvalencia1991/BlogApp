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
      #   describe "x" do
      #   end
      #
      #   describe "x", type: :multisite do
      #   end
      #
      #   # good
      #   # x_spec.rb
      #   describe "x" do
      #   end
      #
      #   # x_multisite_spec.rb
      #   describe "x", type: :multisite do
      #   end
      class NoMixingMultisiteAndStandardSpecs < Cop
        MSG = "Do not mix multisite and standard specs. Consider moving multisite describes to a separate file."

        def initialize(config = nil, options = nil)
          super
          @describes = nil
        end

        def on_block(node)
          return if !top_level?(node)
          return if !describe?(node.children.first)

          type = !!multisite_describe?(node.children.first)

          if !@describes.nil? && @describes != type
            add_offense(node, message: MSG)
          else
            @describes = type
          end
        end

        private

        def_node_matcher :describe?, <<~MATCHER
          (send
            {nil? (const nil? :RSpec)}
            {:describe :context :it}
            ...
          )
        MATCHER

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
