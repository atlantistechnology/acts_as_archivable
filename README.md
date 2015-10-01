# ActsAsArchivable

This gem makes it super easy to move database records to an archive table.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'acts_as_archivable'
```

And then execute:

    $ bundle


## Usage
### Setup

    class Comment < ActiveRecord::Base
      acts_as_archivable months_to_keep: 2
    end

### Scopes

    # all records older than 2 months
    Comment.to_be_archived


### Moving Rows

    # Creates an ArchivedComment, destroys this comment
    @comment.move_to_archive

    # Move appropriate rows to the archive
    Comment.to_be_archived.find_each(&:move_to_archive)
