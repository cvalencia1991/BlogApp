# frozen_string_literal: true

module RuboCop
  module Cop
    module Discourse
      class NoMockingJobs < Cop
        MSG = "Use the test helpers provided by Sidekiq instead of mocking `Jobs.expects(:enqueue)`."

        def_node_matcher :mocking_jobs_enqueue?, <<~MATCHER
        (send (const nil? :Jobs) :expects (:sym :enqueue))
        MATCHER

        def_node_matcher :mocking_jobs_enqueue_in?, <<~MATCHER
        (send (const nil? :Jobs) :expects (:sym :enqueue_in))
        MATCHER

        def on_send(node)
          if mocking_jobs_enqueue?(node) || mocking_jobs_enqueue_in?(node)
            add_offense(node, message: MSG)
          end
        end
      end
    end
  end
end
