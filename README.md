# G5 Updatable

G5 Updatable provides a solution for automatic updates of client and location
data when modified or created in the G5 Hub.

## Current Version

NOT RELEASED

## Installation

1. Add this line to your application's Gemfile:

   ```ruby
   gem 'g5_updatable'
   ```

2. And then execute:

   ```console
   bundle
   ```

3. Mount the engine.

   ```ruby
   # config/routes.rb
   mount G5Updatable::Engine => "/client_feed"
   ```

## Configuration

You can cofigure options within an initializer.

```ruby
# config/initilizers/g5_updatable.rb
G5Updatable.setup do |config|
  # path to the client feed in the G5 Hub
  config.client_uid = #string

  # default is true. When set to true, existing locations in your app will be
  # updated with any changes made to the hub. If set to false, existing locations
  # will be skipped and only newly added locations will be created.
  config.update_locations = #boolean

  # default is false. When set to true, client data will update.
  config.update_client = #boolean

  # default is [:urn, :name]. A whitlist of parameters to update on the model
  config.location_parameters = #array of symbols

  # default is [:name]. A whitlist of parameters to update on the model
  config.client_parameters = #array of symbols
end
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