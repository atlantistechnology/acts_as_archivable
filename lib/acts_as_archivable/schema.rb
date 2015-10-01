module ActsAsArchivable
  module Schema
    def table_schema
      schema = ActiveRecord::SchemaDumper
               .send(:new, ActiveRecord::Base.connection)
               .send(:table, table_name, Tempfile.new('temporary_schema'))
      schema.rewind
      schema.read
    end

    def archived_table_schema
      table_schema.gsub(/#{table_name}/, archived_table_name)
    end
  end
end
