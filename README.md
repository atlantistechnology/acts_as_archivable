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
    class Comment < ActiveRecord::Base
      acts_as_archivable
    end
