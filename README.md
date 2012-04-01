# DependencyInjector

A simple macro, akin to def_delegator for plain and simple dependency
injection.

I'm of the opinion that if you are going to have a convention for dependency
injection, then why not make a macro method.  Then, it's easy to components 
involved in the dependency injection straightforward.

This is plain simple dependency injection and frankly, if you don't like it
at least you have a macro to search on instead of scattered :attr_writer
declarations with their corresponding private :attr_reader methods.

## Installation

Add this line to your application's Gemfile:

    gem 'dependency_injector'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dependency_injector

## Usage

	class Blog
	  extend DependencyInjector
	  def_injector(:request_locator) { Location.public_method(:locate) }
	end

	$ Blog.new.respond_to?(:request_locator)
	=> true
	$ Blog.new.respond_to?(:request_locator)
	=> NoMethodError: private method `request_locator' called for #<Blog:0x00000103408c20>
	$ Blog.new.request_locator = -> { MiniTest::Mock.new }
	=> #<Proc:0x00000101b0bba0@(irb):3 (lambda)>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
