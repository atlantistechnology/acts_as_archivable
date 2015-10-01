module ActsAsArchivable
  module Naming
    def archived_table_name
      "archived_#{table_name}"
    end

    def archived_class_name
      "Archived#{self}"
    end

    def archived_class
      archived_class_name.constantize
    end
  end
end
