# frozen_string_literal: true

module RuboCop
  module Cop
    module Discourse
      # Do not use Nokogiri::HTML.fragment
      # Instead use Nokogiri::HTML5.fragment, which is using Nokogumbo parser
      #
      # @example
      #   # bad
      #   Nokogiri::HTML.fragment("<p>test</p>")
      #
      #   # good
      #   Nokogiri::HTML5.fragment("<p>test</p>")
      class NoNokogiriHtmlFragment < Cop
        MSG = "Nokogiri::HTML.fragment is deprecated and should not be used."

        def_node_matcher :using_nokogiri_html_fragment?, <<-MATCHER
          (send
            (const
              (const nil? :Nokogiri) :HTML) :fragment ...)
        MATCHER

        def on_send(node)
          return if !using_nokogiri_html_fragment?(node)
          add_offense(node, message: MSG)
        end
      end
    end
  end
end
