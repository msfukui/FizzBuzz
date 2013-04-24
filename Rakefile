# coding: UTF-8

require 'rake/testtask'

def remove(path)
  rm_r path if File.exists?(path)
end

Rake::TestTask.new(:test) do |test|
  # LOADPATH に test を追加する。lib は初期値で入っている。
  # c.f. http://rake.rubyforge.org/classes/Rake/TestTask.html
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = false
end

task :report do
  require 'cover_me'

  CoverMe.config do |c|
    c.file_pattern = /(#{CoverMe.config.project.root}\/lib\/.+\.rb)/i
  end

  CoverMe.complete!
end

task :clean do
  remove 'coverage.data'
  remove 'coverage'
end

task :default => :test
