spec = Gem::Specification.new do |s| 
  s.name = 'class_crass'
  s.version = '0.0.1'
  s.author = 'Dan Corrigan'
  s.email = 'dcorrigan@scribenet.com'
  s.homepage = 'http://www.scribenet.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Fat decorator for crass parsed CSS.'
  s.require_paths << 'lib'
  s.files = Dir.glob("{lib}/**/*")
  s.add_development_dependency('rake')
  s.add_development_dependency('pry')
  s.add_development_dependency('minitest', '> 5.0.0')
  s.add_development_dependency('rspec')
  s.add_runtime_dependency('crass')
end
