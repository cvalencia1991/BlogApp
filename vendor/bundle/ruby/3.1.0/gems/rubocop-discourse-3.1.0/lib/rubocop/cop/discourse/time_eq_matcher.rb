# frozen_string_literal: true

module RuboCop
  module Cop
    module Discourse
      # Use `eq_time` matcher with timestamps in specs.
      #
      # @example
      #   # bad
      #   expect(user.created_at).to eq(Time.zone.now)
      #
      #   # good
      #   expect(user.created_at).to eq_time(Time.zone.now)
      class TimeEqMatcher < Cop
        MSG = "Use eq_time when testing timestamps"

        def_node_matcher :using_eq_matcher_with_timestamp?, <<-MATCHER
          (send
            (send nil? :expect
              (send ... #timestamp_suffix?))
            {:to :not_to :to_not}
            (send nil? :eq #not_nil?))
        MATCHER

        def on_send(node)
          return unless using_eq_matcher_with_timestamp?(node)

          add_offense(node, message: MSG)
        end

        def autocorrect(node)
          lambda do |corrector|
            corrector.replace(node.children.last.loc.selector, "eq_time")
          end
        end

        private

        def timestamp_suffix?(property)
          property.is_a?(Symbol) && property =~ /_at$/
        end

        def not_nil?(expression)
          !expression.nil_type?
        end
      end
    end
  end
end
