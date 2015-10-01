module ActsAsArchivable
  module InstanceMethods
    def move_to_archive
      archived_object = self.class.archived_class.create(attributes)
      destroy
      archived_object
    end
  end
end
