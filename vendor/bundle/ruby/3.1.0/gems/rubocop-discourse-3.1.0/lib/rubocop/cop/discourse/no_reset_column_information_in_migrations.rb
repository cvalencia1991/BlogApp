# frozen_string_literal: true

module RuboCop
  module Cop
    module Discourse
      # Do not use `ActiveRecord::ModelSchema.reset_column_information` in
      # migrations. The method is not thread safe and we run migrations
      # concurrently for multisites. Also, we don't encourage the use of
      # ActiveRecord methods in migrations and prefer to write SQL directly.
      class NoResetColumnInformationInMigrations < Cop
        MSG = "ActiveRecord::ModelSchema.reset_column_information is not thread-safe " \
          "and we run migrations concurrently on multisite clusters. Using this " \
          "method also means ActiveRecord methods are being used in migration "\
          "which is discouraged at Discourse. Instead, you should write SQL in your migrations instead."

        def on_send(node)
          return if node.method_name != :reset_column_information
          add_offense(node, message: MSG)
        end
      end
    end
  end
end
