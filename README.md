# Graphviz::Generator

This is a quick hack to support making graphviz diagrams.

I find that when I'm debugging something, I want to record information
if a particular way. This is a layer over
[ruby-graphviz](https://github.com/glejeune/Ruby-Graphviz) to
facilitate that.

It's primary purpose is to allow me to define subgraphs and nodes in a
hierarchical fashion, and then build unique names for dot. Take a look
at the [examples](./examples/).

## TODO and Bugs

Legends are currently broken.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'graphviz-generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install graphviz-generator

## Usage

## Development

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/directionless/graphviz-generator.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
