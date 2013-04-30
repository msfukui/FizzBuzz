# coding: UTF-8

require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  # LOADPATH に test を追加する。lib は初期値で入っている。
  # c.f. http://rake.rubyforge.org/classes/Rake/TestTask.html
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = false
end

task :default => :test
