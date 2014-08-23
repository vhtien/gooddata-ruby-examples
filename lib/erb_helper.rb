# encoding: UTF-8

require 'erb'
require 'pathname'

class ErbHelper
  BASE_DIR = File.join(File.dirname(__FILE__), '..')

  FILES = [
    './src/_general/*.rb.erb',
    './**/*.rb.erb',
    './**/*.asciidoc.erb',
  ]

  def clean
    FILES.each do |files|
      Dir[files].each do |f|
        tfile = f.gsub(/\.erb/, '')
        if File.exist? tfile
          puts "Deleting #{tfile}"
          FileUtils.rm_rf tfile
        end
      end
    end
  end

  def render(filename)
    path = File.join(BASE_DIR, filename)
    File.read(path)
  end

  def render_ruby(filename)
    b = binding

    content = render(filename) do
      yield if block_given?
    end

    erb = ERB.new(content)
    erb.filename = filename
    res = erb.result b

    "[source, ruby]\n----\n#{res}\n----"
  end

  def process(files)
    b = binding
    Dir[files].each do |filename|
      erb = ERB.new(File.read(filename))
      erb.filename = filename

      res = erb.result b
      File.open(filename.gsub(/\.erb/, ''), 'wt') do |f|
        puts "Processing #{filename}"
        f.write res
      end
    end
  end


  def run
    FILES.each do |files|
      process(files)
    end
  end
end
