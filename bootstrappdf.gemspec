Gem::Specification.new do |s|
  s.name        = 'bootstrappdf'
  s.version     = '0.0.4'
  s.date        = '2012-08-21'
  s.summary     = 'Twitter Bootstrap PDF creation tool'
  s.description = <<-END
    "BootstrapPDF is a tool for creating good looking and well structured PDFs
    with the help of Twitter Bootstrap."
  END
  s.authors     = 'whirlwin'
  s.homepage    = 'http://github.com/whirlwin/bootstrappdf'
  s.add_dependency 'haml'
  s.add_dependency 'pdfkit'
  s.add_dependency 'wkhtmltopdf'
  s.files       = Dir.glob('{bin,lib}/**/*')
  s.executables << 'bootstrappdf'
end
