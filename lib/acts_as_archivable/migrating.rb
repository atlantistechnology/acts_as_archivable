module ActsAsArchivable
  module Migrating
    def create_archived_table
      return if ActiveRecord::Migration.table_exists?(archived_table_name)
      eval(archived_table_schema)
    end
  end
end
