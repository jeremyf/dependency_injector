# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dependency_injector/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jeremy Friesen"]
  gem.email         = ["jeremy.n.friesen@gmail.com"]
  gem.description   = %q{A thus far stupidly simple dependency injector}
  gem.summary       = %q{Simple dependency injector}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dependency_injector"
  gem.require_paths = ["lib"]
  gem.version       = DependencyInjector::VERSION
end
