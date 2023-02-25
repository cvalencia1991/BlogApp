# frozen_string_literal: true

module RuboCop
  module Cop
    module Discourse
      # Use `Time.zone.now` instead of `Time.new` without arguments.
      #
      # @example
      #   # bad
      #   now = Time.new
      #
      #   # good
      #   now = Time.zone.now
      class NoTimeNewWithoutArgs < Cop
        MSG = "Use `Time.zone.now` instead of `Time.new` without arguments."

        def_node_matcher :time_new_without_args?, <<-MATCHER
          (send (const nil? :Time) :new)
        MATCHER

        def on_send(node)
          return unless time_new_without_args?(node)

          add_offense(node, message: MSG)
        end

        def autocorrect(node)
          lambda do |corrector|
            corrector.replace(node.loc.expression, "Time.zone.now")
          end
        end
      end
    end
  end
end
