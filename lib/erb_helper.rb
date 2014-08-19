# encoding: UTF-8

require 'erb'
require 'pathname'

class ErbHelper
  BASE_DIR = File.join(File.dirname(__FILE__), '..')

  def render(filename)
    path = File.join(BASE_DIR, filename)
    File.read(path)
  end

  def render_ruby(filename)
    content = render(filename)
    "[source, ruby]\n----\n#{content}\n----"
  end

  def run
    b = binding
    Dir['./**/*.asciidoc.erb'].each do |filename|
      erb = ERB.new(File.read(filename))
      erb.filename = filename

      res = erb.result b
      File.open(filename.gsub(/\.erb/, ''), 'wt') do |f|
        f.write res
      end
    end
  end
end
