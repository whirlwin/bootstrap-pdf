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
  opt.banner = 'Usage: bootstrap-pdf COMMAND [OPTIONS]'
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

    Dir.glob(File.join File.dirname(File.expand_path __FILE__),
                       '../res/bootstrap/css/*.css').each do |file|
      kit.stylesheets << file
    end

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
