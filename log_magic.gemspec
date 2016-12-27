Gem::Specification.new do |s|
  s.name        = 'log_magic'
  s.version     = '0.0.2'
  s.date        = '2016-12-27'
  s.summary     = "LogMagic explains your logs"
  s.description = """
  By analysing your development.log,
  log_magic gives you insights about your services.
  """
  s.authors     = ["Manuel Korfmann"]
  s.email       = 'manu@korfmann.info'
  s.files       =  Dir.glob("{bin,lib}/**/*")
  s.homepage    =
    'http://rubygems.org/gems/log_magick'
  s.license       = 'MIT'

  s.executables << 'log_magic'

  s.add_dependency 'file-tail'
  s.add_dependency 'rack'
  s.add_dependency 'haml'
  s.add_dependency 'redis'
  s.add_development_dependency 'byebug'
end
