
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lolipop/mc/starter/rails/version"

Gem::Specification.new do |spec|
  spec.name          = 'lolipop-mc-starter-rails'
  spec.version       = Lolipop::Mc::Starter::Rails::VERSION
  spec.authors       = ['k1low']
  spec.email         = ['k1low@pepabo.com']

  spec.summary       = 'Lolipop! Managed Cloud Starter for Rails.'
  spec.description   = 'Lolipop! Managed Cloud Starter for Rails.'
  spec.homepage      = 'https://github.com/k1LoW/lolipop-mc-starter-rails'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5'
  spec.add_runtime_dependency 'dry-inflector'
  spec.add_runtime_dependency 'paint'
  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'tty-prompt'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'octorelease'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
