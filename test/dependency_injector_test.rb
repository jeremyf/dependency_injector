$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'dependency_injector'
require 'test/unit'

class DependencyInjectorTest < Test::Unit::TestCase
  def setup
    @klass = Class.new {
      extend DependencyInjector
      def_injector(:foo) { :default_foo }
      
      def get_foo; foo; end
    }
    @object = @klass.new
  end
  
  def test_creates_public_writer
    @object.foo = :baz
    assert_equal :baz, @object.get_foo
  end

  def test_creates_private_method
    assert_raises NoMethodError, "private method `foo' called" do
      @object.foo
    end
  end
  
  def test_default_injected_value
    assert_equal :default_foo, @object.get_foo
  end

  def test_overridden_injected_value
    @object.foo = :override
    assert_equal :override, @object.get_foo
  end
end
