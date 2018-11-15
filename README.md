# CloudbuildViz


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloudbuild_viz'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudbuild_viz

### Side dependency
`graphviz` should also be installed

For Mac
```
brew install graphviz
```

## Usage

From CLI
```
bundle exec graph cloudbuildfile.yaml render_image.png
```

For a Ruby or Rails application
```ruby
require 'cloudbuild_viz'

class ApplicationController < ActionController::Base

.
.
.
	
	def make_build_graph
		CloudbuildViz.make('cloudbuildfile.yaml', '/tmp/images/render_image.png')
    end
.
.
.

end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/weiyuan-lane/cloudbuild_viz.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
