# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{riddle}
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Pat Allan}]
  s.date = %q{2011-08-01}
  s.description = %q{A Ruby API and configuration helper for the Sphinx search service.}
  s.email = %q{pat@freelancing-gods.com}
  s.extra_rdoc_files = [%q{README.textile}]
  s.files = [%q{README.textile}]
  s.homepage = %q{http://freelancing-god.github.com/riddle/}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{An API for Sphinx, written in and for Ruby.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<mysql2>, ["= 0.3.2"])
      s.add_development_dependency(%q<jeweler>, ["= 1.5.1"])
      s.add_development_dependency(%q<rspec>, [">= 2.5.0"])
      s.add_development_dependency(%q<yard>, [">= 0.6.8"])
    else
      s.add_dependency(%q<mysql2>, ["= 0.3.2"])
      s.add_dependency(%q<jeweler>, ["= 1.5.1"])
      s.add_dependency(%q<rspec>, [">= 2.5.0"])
      s.add_dependency(%q<yard>, [">= 0.6.8"])
    end
  else
    s.add_dependency(%q<mysql2>, ["= 0.3.2"])
    s.add_dependency(%q<jeweler>, ["= 1.5.1"])
    s.add_dependency(%q<rspec>, [">= 2.5.0"])
    s.add_dependency(%q<yard>, [">= 0.6.8"])
  end
end
