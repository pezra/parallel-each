# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{parallel-each}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Williams"]
  s.date = %q{2009-08-27}
  s.description = %q{Parallel iteration for Enumerable}
  s.email = %q{pezra@barelyenough.org}
  s.extra_rdoc_files = ["CHANGELOG", "lib/bounded_async_task_runner.rb", "lib/parallel_each.rb", "LICENSE", "README.markdown"]
  s.files = ["CHANGELOG", "lib/bounded_async_task_runner.rb", "lib/parallel_each.rb", "LICENSE", "Manifest", "Rakefile", "README.markdown", "spec/bounded_async_task_runner_spec.rb", "spec/parallel_each_spec.rb", "spec/spec_helper.rb", "parallel-each.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/pezra/parallel-each}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Parallel-each", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{parallel-each}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Parallel iteration for Enumerable}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
