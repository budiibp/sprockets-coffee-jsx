# sprockets-coffee-jsx

Preprocessor for Coffeescript with React JSX (CJSX) support.

This is an updated version of [sprockets-coffee-react](https://github.com/jsdf/sprockets-coffee-react) gem.

This gem makes it easy to integrate this into the Rails asset pipeline or other Sprockets chains.

# Usage

Add this gem to your Gemfile:

```ruby
gem 'sprockets-coffee-jsx'
```

You can name your `JSX` asset files as `.js.coffee.cjsx`, `.js.cjsx` or `.js.coffee`.

# Rack

If you're not using rails, you'll need to register the Sprockets preprocessor manually. Here is an
adapted version of the Rack example provided by Sprockets, which additionally requires and registers
the sprockets-coffee-jsx engine:

```ruby
require 'sprockets'
require 'sprockets/coffee-react'
map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.register_mime_type 'text/cjsx', extensions: ['.cjsx', '.js.cjsx', '.js.coffee.cjsx'], charset: :unicode
  environment.register_transformer 'text/cjsx', 'application/javascript', Sprockets::CoffeeReactScript
  environment.register_preprocessor 'application/javascript', Sprockets::CoffeeReact
  environment.register_postprocessor 'application/javascript', Sprockets::CoffeeReactPostprocessor
  run environment
end

map '/' do
  run YourRackApp
end
```

# Middleman

Add the following to your config.rb file:

```ruby
require 'sprockets/coffee-react'
::Sprockets.register_mime_type 'text/cjsx', extensions: ['.cjsx', '.js.cjsx', '.js.coffee.cjsx'], charset: :unicode
::Sprockets.register_transformer 'text/cjsx', 'application/javascript', Sprockets::CoffeeReactScript
::Sprockets.register_preprocessor 'application/javascript', Sprockets::CoffeeReact
::Sprockets.register_postprocessor 'application/javascript', Sprockets::CoffeeReactPostprocessor
```

# License

Released under the MIT License.  See the LICENSE file for further details.
