
Gem::Specification.new do |s|
  s.platform                    = Gem::Platform::RUBY
  s.name                        = 'boris'
  s.version                     = '0.1.0'
  s.summary                     = 'TFL (unoffical) API Ruby bindings'
  s.description                 = 'Ruby API bindings and CLI utility to get Boris Bike docking station status, Bus and Tube times.'

  s.required_ruby_version       = '>= 1.8.7'

  s.author                      = 'Stevie Graham'
  s.email                       = 'sjtgraham@mac.com'
  s.homepage                    = 'http://github.com/stevegraham/boris'

  s.add_dependency                'httparty',      '~> 0.10.2'
  s.add_dependency                'activesupport', '>= 2.2.1'
  s.add_dependency                'hirb',          '~> 0.7.1'

  s.add_development_dependency    'rspec',          '>= 2.12.0'
  s.add_development_dependency    'mocha',          '>= 0.13.2'
  s.add_development_dependency    'rake',           '~> 10.0.3'

  s.files                       = Dir['README.md', 'lib/**/*']
  s.require_path                = 'lib'

  s.executables << 'boris'
end

