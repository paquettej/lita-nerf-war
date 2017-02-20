Gem::Specification.new do |spec|
  spec.name          = "lita-nerf-war"
  spec.version       = "0.1.7"
  spec.authors       = ["Jeff Paquette"]
  spec.email         = ["jeff@snowmoonsoftware.com"]
  spec.description   = "Virtual dart fights for your slack rooms"
  spec.summary       = "Nerf guns at work are great. Want to get someone's attention? Shoot them with a dart -- it works great. But eventually someone complains and the dart guns end up in a drawer somewhere. End of the fun, right? Wrong! Virtualization isn't just for servers any longer. Now you can virtualize your nerf war too!"
  spec.homepage      = "https://github.com/snowmoonsoftware/lita-nerf-war"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '~> 2.1'

  spec.add_runtime_dependency "lita", ">= 4.3"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake", "~> 11"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec"
end
