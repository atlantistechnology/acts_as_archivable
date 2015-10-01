require 'spec_helper'

describe ActsAsArchivable::Schema do
  before(:all) do
    class PageRequest < ActiveRecord::Base
      acts_as_archivable
    end
  end
  subject! { PageRequest }
  let!(:schema) do
    "  create_table \"page_requests\", force: :cascade do |t|\n    t.integer  \"monitored_page_id\", limit: 4\n    t.integer  \"status\",            limit: 4\n    t.float    \"response_time\",     limit: 24\n    t.datetime \"created_at\",                    null: false\n    t.datetime \"updated_at\",                    null: false\n    t.string   \"proxy\",             limit: 255\n  end\n\n  add_index \"page_requests\", [\"proxy\"], name: \"index_page_requests_on_proxy\", using: :btree\n\n"
  end

  it { is_expected.to respond_to :table_schema }
  it { is_expected.to respond_to :archived_table_schema }

  it 'formats an archived schema' do
    allow(subject).to receive(:table_schema).and_return schema
    expect(subject.archived_table_schema).to include 'ActiveRecord::Migration.create_table "archived_page_requests"'
    expect(subject.archived_table_schema).to include 'ActiveRecord::Migration.add_index "archived_page_requests"'
    puts subject.archived_table_schema
  end
end
