require 'fileutils'
require 'pry'
require 'rake'
require 'active_support/all'

chapters = FileList.new('*').reject {|f| File.file?(f)} - ['script']
chapters.each do |chapter|
  FileUtils.cd(chapter) do |dir|
    File.open('chapter.asciidoc', 'w') do |f|
      f.puts "== #{chapter.titleize}"
      (FileList.new('*.asciidoc') - ['chapter.asciidoc']).each do |article|
        f.puts ""
        f.puts "include::#{article}[]"
      end
    end
  end
end


# generate book.asciidoc
File.open('book.asciidoc', 'w') do |f|
  f.puts ":bookseries: cookbook"
  f.puts "= GoodData SDK Cookbook"
  f.puts ""

  chapters.each do |chapter|
    f.puts "include::#{chapter}/chapter.asciidoc[]"
    f.puts ""
  end
end

system "asciidoctor book.asciidoc -b pdf"

# File.delete('book.asciidoc')
# Dir.glob('**/chapter.asciidoc').each {|f| File.delete(f)}