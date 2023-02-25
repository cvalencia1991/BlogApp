# frozen_string_literal: true

module RuboCop
  module Cop
    module Discourse
      # Do not use URI.escape and its ilk, they are deprecated
      # with a warning in the ruby source. Instead use
      # Addressable::URI, which has encode, encode_component,
      # and unencode methods. UrlHelper has helper methods for this.
      #
      # # @example
      #   # bad
      #   URI.encode("https://a%20a.com?a='a%22")
      #
      #   # good
      #   UrlHelper.encode("https://a%20a.com?a='a%22")
      #   Addressable::URI.encode("https://a%20a.com?a='a%22")
      class NoURIEscapeEncode < Cop
        MSG = "URI.escape, URI.encode, URI.unescape, URI.decode are deprecated and should not be used."

        def_node_matcher :using_uri_escape?, <<-MATCHER
          (send (const nil? :URI) :escape ...)
        MATCHER

        def_node_matcher :using_uri_encode?, <<-MATCHER
          (send (const nil? :URI) :encode ...)
        MATCHER

        def_node_matcher :using_uri_unescape?, <<-MATCHER
          (send (const nil? :URI) :unescape ...)
        MATCHER

        def_node_matcher :using_uri_decode?, <<-MATCHER
          (send (const nil? :URI) :decode ...)
        MATCHER

        def on_send(node)
          return if [
            using_uri_escape?(node),
            using_uri_encode?(node),
            using_uri_unescape?(node),
            using_uri_decode?(node)
          ].none?
          add_offense(node, message: MSG)
        end
      end
    end
  end
end
