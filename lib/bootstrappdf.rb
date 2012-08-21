require 'haml'
require 'optparse'
require 'pdfkit'

def convert_haml file
  Haml::Engine.new(convert_html file).render
end

def convert_html file
  IO.read file
end

options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = 'Usage: bootstrappdf COMMAND [OPTIONS]'
  opt.separator ''
  opt.separator 'Commands'
  opt.separator '     foo.haml: converts foo.haml to a PDF'
  opt.separator '     bar.html: converts bar.html to a PDF'
  opt.separator 'Options'

  opt.on '-s', '--stylesheets DIR', 'Your CSS dir to look' do |dir|
    options[:css_dir] = dir
  end

  opt.on '-h', '--help', 'help' do
    puts opt_parser
    exit
  end
end

opt_parser.parse!

begin
  unless ARGV[0].nil?
    kit = PDFKit.new send("convert_#{File.extname(ARGV[0])[1..-1]}", ARGV[0])

    Dir.glob('res/bootstrap/css/*.css').each do |file|
      kit.stylesheets << File.expand_path(file)
    end

    #kit.stylesheets << File.expand_path('res/bootstrap/css/bootstrap.min.css')

    unless options[:css_dir].nil?
      Dir.glob("#{options[:css_dir]}/**/*.css").each do |file|
        kit.stylesheets << file
      end
    end

    kit.to_file 'out.pdf'
  else
    raise 'Please provide a file to convert'
  end
rescue Exception => e
  puts e, opt_parser
end

=begin
task :haml do
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

      kit.to_file 'out.pdf'
  end
end
=end
