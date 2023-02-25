# frozen_string_literal: true

module RuboCop
  module Cop
    module Discourse
      # Use `response.parsed_body` instead of `JSON.parse(response.body)` in specs.
      #
      # @example
      #   # bad
      #   expect(::JSON.parse(response.body)).to eq({})
      #
      #   # good
      #   expect(response.parsed_body).to eq({})
      class NoJsonParseResponse < Cop
        MSG = "Use `response.parsed_body` instead of `JSON.parse(response.body)` in specs."

        def_node_matcher :json_parse_body?, <<-MATCHER
          (send
            (const {cbase nil?} :JSON) :parse
            (send
              (send nil? :response) :body))
        MATCHER

        def on_send(node)
          return unless json_parse_body?(node)

          add_offense(node, message: MSG)
        end

        def autocorrect(node)
          lambda do |corrector|
            corrector.replace(node.loc.expression, "response.parsed_body")
          end
        end
      end
    end
  end
end
