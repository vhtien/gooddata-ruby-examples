# encoding: UTF-8

# require 'rake/notes/rake_task'
# require 'rspec/core/rake_task'

desc 'Build book'
task :build do
  system 'cd lib && rake build'
end

desc 'Run continuous integration'
task :ci do
  system 'cd lib && rake ci'
end

desc 'Run all tests'
task :test => 'test:all'

task :usage do
  puts 'No rake task specified, use rake -T to list them'
end

# deploy task is in the root, because we need to push stuff to gh-pages branch
# where the lib directory doesn't exist
desc 'Deploy the book to the web'
task :deploy do
  last_commit = `git log -n 1`.split("\n")[0].split(' ')[1] rescue 'unknown'
  # build the book
  Rake::Task['build'].invoke

  # checkout the gh-pages branch
  system('git checkout gh-pages') or fail "Checkout failed"

  # make it an index and push it there
  `mv book.html index.html
   git add index.html
   git commit -m "new cookbook version from master #{last_commit}"
   git push origin gh-pages
   git checkout master`
end

desc 'Clean generated files'
task :clean do
   system 'git clean -f'
end


task :default => [:usage]
