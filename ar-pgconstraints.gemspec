require './lib/ar/pgconstraint/version'

Gem::Specification.new do |spec|
  spec.name          = 'ar-pgconstraint'
  spec.version       = AR::PGConstraint::VERSION
  spec.authors       = ['Dmytro Soltys', 'Nando Vieira']
  spec.email         = ['soap+arpgconstraint@slotos.net']

  spec.summary       = "Enable PostgreSQL's CHECK and EXCLUDE constraints on ActiveRecord migrations"
  spec.description   = spec.summary
  spec.homepage      = 'https://rubygems.org/gems/ar-pgconstraint'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`
                       .split("\x0")
                       .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest-utils'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'pry-meta'
  spec.add_development_dependency "appraisal"
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
