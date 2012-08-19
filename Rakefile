require 'haml'
require 'pdfkit'

# Haml to PDF
task :htp do
  files = Dir.glob '**/*.haml'

  case files.length
    when 0
      raise 'Please provide at least one HAML file'
    when 1..(1.0 / 0.0)
      contents = files.each_with_object String.new do |input, output|
        output << IO.read(input)
      end

      kit = PDFKit.new Haml::Engine.new(contents).render

      Dir.glob('res/**/*.css').each do |file|
        kit.stylesheets << file
      end

      kit.to_file 'cv.pdf'
  end
end

task :test do
  puts Haml::Engine.new(IO.read 'cv.haml').render
end
