require 'active_record'
require 'active_record/version'
require 'active_support/core_ext/module'

require 'acts_as_archivable/version'
require 'acts_as_archivable/naming'
require 'acts_as_archivable/schema'
require 'acts_as_archivable/migrating'
require 'acts_as_archivable/instance_methods'

module ActsAsArchivable
  def acts_as_archivable(options = {})
    extend ActsAsArchivable::Naming
    extend ActsAsArchivable::Schema
    extend ActsAsArchivable::Migrating

    options[:months_to_keep] ||= 2

    scope :to_be_archived, -> { where('created_at < ?', options[:months_to_keep].months.ago) }

    Object.const_set(archived_class_name, Class.new(self))
    archived_class.table_name = archived_table_name
  end
end

ActiveSupport.on_load(:active_record) do
  extend ActsAsArchivable
  include ActsAsArchivable::InstanceMethods
end
