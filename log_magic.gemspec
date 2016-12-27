Gem::Specification.new do |s|
  s.name        = 'log_magic'
  s.version     = '0.0.0'
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

  s.add_dependency 'file-tail'
end
