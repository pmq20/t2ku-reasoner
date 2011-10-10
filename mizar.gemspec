# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mizar}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{pmq20 (P.S.V.R))}]
  s.date = %q{2011-10-10}
  s.description = %q{A Mizar Console with Sophisticated Reasoning Support}
  s.email = %q{pmq2001@gmail.com}
  s.executables = [%q{mizpry}]
  s.files = Dir.glob("{bin,lib}/**/*") + %w(README CHANGELOG LICENCE)
  s.homepage = %q{https://github.com/pmq20/t2ku-reasoner}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{A Mizar Console with Sophisticated Reasoning Support}
  s.test_files = []

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby_parser>, ["~> 2.0.5"])
      s.add_runtime_dependency(%q<coderay>, ["~> 0.9.8"])
      s.add_runtime_dependency(%q<slop>, ["~> 2.1.0"])
      s.add_runtime_dependency(%q<method_source>, ["~> 0.6.5"])
      s.add_development_dependency(%q<bacon>, ["~> 1.1.0"])
      s.add_development_dependency(%q<open4>, ["~> 1.0.1"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
    else
      s.add_dependency(%q<ruby_parser>, ["~> 2.0.5"])
      s.add_dependency(%q<coderay>, ["~> 0.9.8"])
      s.add_dependency(%q<slop>, ["~> 2.1.0"])
      s.add_dependency(%q<method_source>, ["~> 0.6.5"])
      s.add_dependency(%q<bacon>, ["~> 1.1.0"])
      s.add_dependency(%q<open4>, ["~> 1.0.1"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<ruby_parser>, ["~> 2.0.5"])
    s.add_dependency(%q<coderay>, ["~> 0.9.8"])
    s.add_dependency(%q<slop>, ["~> 2.1.0"])
    s.add_dependency(%q<method_source>, ["~> 0.6.5"])
    s.add_dependency(%q<bacon>, ["~> 1.1.0"])
    s.add_dependency(%q<open4>, ["~> 1.0.1"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
  end
end

