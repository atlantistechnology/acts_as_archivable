require 'spec_helper'

describe ActsAsArchivable::Naming do
  before(:all) do
    class PageRequest < ActiveRecord::Base
      acts_as_archivable
    end
  end
  subject! { PageRequest }

  it 'identifies archived class name' do
    expect(subject.archived_class_name).to eq 'ArchivedPageRequest'
  end

  it 'identifies archived table name' do
    expect(subject.archived_table_name).to eq 'archived_page_requests'
  end

  it 'identifies archived class' do
    expect(subject.archived_class).to eq ArchivedPageRequest
  end
end
