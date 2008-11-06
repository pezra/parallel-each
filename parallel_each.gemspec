Gem::Specification.new do |s|
  s.name     = "parallel_each"
  s.version  = "0.1.0"
  s.date     = "2008-11-05"
  s.summary  = "Parallelized Enumerable methods"
  s.email    = "pezra@barelyenough.org"
  s.homepage = "http://github.com/pezra/parallel-each"
  s.description = "Provides enumerable methods with a configurable level of parallelism.  Suitable for parallelizing non-trivial operations on large Enumerables."
  s.has_rdoc = true
  s.authors  = ["Peter Williams"]
  s.files    = ["README.txt", 
		"parallel_each.gemspec", 
		"lib/bounded_async_task_runner.rb", 
		"lib/parallel_each.rb"]
  s.test_files = ["spec/bounded_async_task_runner_spec.rb",
     "spec/spec_helper.rb"]
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = ["README.txt"]
end
