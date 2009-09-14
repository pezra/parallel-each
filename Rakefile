require 'rubygems'
require 'rake'
require 'spec/rake/spectask'
require 'echoe'
require 'yard'

Spec::Rake::SpecTask.new

Echoe.new('parallel-each') do |p|
  p.description     = "Parallel iteration for Enumerable"
  p.url             = "http://github.com/pezra/parallel-each"
  p.author          = "Peter Williams"
  p.email           = "pezra@barelyenough.org"
  p.retain_gemspec  = true
end


desc "Generate Yardoc"
YARD::Rake::YardocTask.new

desc "Update rubyforge documentation"
task :update_docs => :yardoc do
  puts %x{rsync -aPz doc/* pezra@parallel-each.rubyforge.org:/var/www/gforge-projects/parallel-each/}
end
