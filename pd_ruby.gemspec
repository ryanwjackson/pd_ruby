# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pd_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'pd_ruby'
  spec.version       = PDRuby::VERSION
  spec.authors       = ['Ryan Jackson']
  spec.email         = ['ryanwjackson@gmail.com']

  spec.summary       = 'Print debug statements with ease.'
  spec.description   = 'Print debug statements with ease.'
  spec.homepage      = 'https://github.com/ryanwjackson/pd_ruby'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/ryanwjackson/pd_ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/ryanwjackson/pd_ruby'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency('bump')
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_runtime_dependency('colorize', '>= 0')
end
