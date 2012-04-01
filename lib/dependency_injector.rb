require "dependency_injector/version"

module DependencyInjector
  # A simple macro for creating an easy dependency injector.
  def def_injector(method_name, &default)
    attr_writer method_name

    define_method(method_name) do
      if returning_value = instance_variable_get("@#{method_name}")
        returning_value
      else

        returning_value = instance_eval(&default)
        instance_variable_set("@#{method_name}", returning_value)
        returning_value
      end
    end
    private method_name
  end
end
