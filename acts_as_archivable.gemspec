# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_archivable/version'

Gem::Specification.new do |spec|
  spec.name          = 'acts_as_archivable'
  spec.version       = ActsAsArchivable::VERSION
  spec.authors       = ['Jon Collier']
  spec.email         = ['jcollier@atlantistech.com']
  spec.summary       = 'ActsAsArchivable makes it super easy '\
                       'to move database records to an archive table.'
  spec.description   = 'There has never been a better time '\
                       'to move database records to an archive table.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
end
