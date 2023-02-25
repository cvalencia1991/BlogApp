# frozen_string_literal: true

module RuboCop
  module Cop
    module Discourse
      # The methods:
      #
      # * add_reference
      # * add_belongs_to
      # * t.references
      # * t.belongs_to
      #
      # in ActiveRecord migrations are magic, and they all do
      # some unexpected things in the background. For example, by default
      # add_reference adds an index at the same time, but not concurrently,
      # which is a nightmare for large tables.
      #
      # Instead, inside a disable_ddl_transaction! migration we should create
      # the new column (with any defaults and options required) and the index
      # concurrently using hand-written SQL. This also allows us to handle
      # IF NOT EXISTS cases, which enable re-runnable migrations. Also we
      # can pick a better name for the index at the same time.
      #
      # @example
      #
      # # bad
      # def up
      #   add_reference :posts, :image_upload
      #   # or add_belongs_to :posts, :image_upload
      #   # or t.references :image_upload when doing create_table do |t|
      #   # or t.belongs_to :image_upload when doing create_table do |t|
      # end
      #
      # # good
      # disable_ddl_transaction!
      # def up
      #   execute <<~SQL
      #     ALTER TABLE posts
      #     ADD COLUMN IF NOT EXISTS image_upload_id bigint
      #   SQL
      #
      #   execute <<~SQL
      #     CREATE INDEX CONCURRENTLY IF NOT EXISTS
      #     index_posts_on_image_upload_id ON posts USING btree (image_upload_id)
      #   SQL
      # end
      class NoAddReferenceOrAliasesActiveRecordMigration < Cop
        MSG = <<~MSG
          AR methods add_reference, add_belongs_to, t.references, and t.belongs_to are
          high-risk for large tables and have too many background magic operations.
          Instead, write a disable_ddl_transactions! migration and write custom SQL to
          add the new column and CREATE INDEX CONCURRENTLY. Use the IF NOT EXISTS clause
          to make the migration re-runnable if it fails partway through.
        MSG

        def_node_matcher :using_add_reference?, <<-MATCHER
          (send nil? :add_reference ...)
        MATCHER

        def_node_matcher :using_add_belongs_to?, <<-MATCHER
          (send nil? :add_belongs_to ...)
        MATCHER

        def_node_matcher :using_t_references?, <<-MATCHER
          (send (lvar _) :references ...)
        MATCHER

        def_node_matcher :using_t_belongs_to?, <<-MATCHER
          (send (lvar _) :belongs_to ...)
        MATCHER

        def on_send(node)
          return if [
            using_add_reference?(node),
            using_add_belongs_to?(node),
            using_t_references?(node),
            using_t_belongs_to?(node)
          ].none?
          add_offense(node, message: MSG)
        end
      end
    end
  end
end
