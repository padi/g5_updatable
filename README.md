# G5 Updatable

[![Gem Version](https://badge.fury.io/rb/g5_updatable.svg)](http://badge.fury.io/rb/g5_updatable)
[![Build Status](https://travis-ci.org/G5/g5_updatable.png?branch=master)](https://travis-ci.org/G5/g5_updatable)

G5 Updatable provides a solution for automatic updates of client and location
data when modified or created in the G5 Hub.

## Requirements

G5 Updatable makes use of PostgrSQL's `json` field type, and so only supports implementing apps that also use PostgreSQL.

## Installation

1. Add this line to your application's Gemfile:

   ```ruby
   gem 'g5_updatable'
   ```

2. And then execute:

   ```console
   bundle
   ```
3. Run the generator.

   ```ruby
   rails g g5_updatable:install
   ```

   This mounts the engine at `/g5_updatable`.

3. And copy the engine's migrations to your application:

  ```console
    rake g5_updatable:install:migrations
  ```

## Usage

G5 Updatable exposes a POST route at `/g5_updatable/update` that accepts a
`client_uid` parameter (the URL for the client's detail page within the G5
Hub). When the route is hit, it will update/create Location and Client.

See the [G5-Hub](https://github.com/G5/g5-hub/blob/master/lib/webhook_poster.rb) webhook logic for further info.

### Location Association

You will likely have models in your own application that are associated with a Location. A module is available to include in your related models to support this association. Assuming your model has a `location_uid` string field, you can use the module as follows:

```ruby
class Foo < ActiveRecord::Base
  include G5Updatable::BelongsToLocation
end
```

It provides a `#location` method that will fetch the correct location.

### Spec Helpers

The engine provides a helper files that can be included in your project to bring in some testing support. Currently this is limited to (some factory definitions)[https://github.com/G5/g5_updatable/blob/active-record-up-in-here/lib/g5_updatable/rspec/factories.rb]. In rspec you can add the following line to your `spec/spec_helper.rb`:

```ruby
require 'g5_updatable/rspec'
```

## Authors

* Brian Bauer / [@bbauer](https://github.com/bbauer)

## Contributing

1. [Fork it](https://github.com/G5/g5_updatable/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write your code and **specs**
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

If you find bugs, have feature requests or questions, please
[file an issue](https://github.com/G5/g5_updatable/issues).

## Specs

The `database.yml` for the dummy app must be created and modified to match your
PostgreSQL configuration. If you are using the [G5 Orion
Vagrant](https://github.com/G5/g5-orion-vagrant) image, the sample file should
just work. You can copy it into place with:
```bash
$ cp spec/dummy/config/database.sample.yml spec/dummy/config/database.yml
```

Run specs via `rspec` with:

```bash
$ rspec spec
```

## License

Copyright (c) 2014 G5

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
