# ActsAsArchivable

ActsAsArchivable makes it super easy to move database records to an archive table.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'acts_as_archivable', git: 'git@github.com:atlantistechnology/acts_as_archivable.git'
```

And then execute:

    $ bundle

## WARNING
This gem contains an `eval` call! `lib/acts_as_archivable/migrating.rb` calls `eval(archived_table_schema)` in order to create the archived version of a given table.

## Usage
### Setup

    class Comment < ActiveRecord::Base
      acts_as_archivable months_to_keep: 2
    end

    # Copy the comments table structure to archived_comments
    Comment.create_archived_table

### Scopes

    # all records older than 2 months
    Comment.to_be_archived


### Moving Rows

    # Creates an ArchivedComment, destroys this comment
    @comment.move_to_archive

    # Move appropriate rows to the archive
    Comment.to_be_archived.find_each(&:move_to_archive)
