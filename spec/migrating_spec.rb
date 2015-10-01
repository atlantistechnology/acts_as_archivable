require 'spec_helper'

describe ActsAsArchivable::Migrating do
  before(:all) do
    class PageRequest < ActiveRecord::Base
      acts_as_archivable
    end
  end
  subject! { PageRequest }

  it { is_expected.to respond_to :create_archived_table }
end
