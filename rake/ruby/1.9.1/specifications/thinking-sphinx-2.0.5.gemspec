# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{thinking-sphinx}
  s.version = "2.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Pat Allan}]
  s.date = %q{2011-05-24}
  s.description = %q{A concise and easy-to-use Ruby library that connects ActiveRecord to the Sphinx search daemon, managing configuration, indexing and searching.}
  s.email = %q{pat@freelancing-gods.com}
  s.extra_rdoc_files = [%q{README.textile}]
  s.files = [%q{README.textile}]
  s.homepage = %q{http://ts.freelancing-gods.com}
  s.post_install_message = %q{If you're upgrading, you should read this:
http://freelancing-god.github.com/ts/en/upgrading.html

}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{ActiveRecord/Rails Sphinx library}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.3"])
      s.add_runtime_dependency(%q<riddle>, [">= 1.3.3"])
      s.add_development_dependency(%q<mysql>, ["= 2.8.1"])
      s.add_development_dependency(%q<pg>, ["= 0.9.0"])
      s.add_development_dependency(%q<actionpack>, [">= 3.0.3"])
      s.add_development_dependency(%q<jeweler>, ["= 1.5.1"])
      s.add_development_dependency(%q<yard>, ["= 0.6.8"])
      s.add_development_dependency(%q<rspec>, ["= 2.5.0"])
      s.add_development_dependency(%q<rspec-core>, ["= 2.5.0"])
      s.add_development_dependency(%q<rspec-expectations>, ["= 2.5.0"])
      s.add_development_dependency(%q<rspec-mocks>, ["= 2.5.0"])
      s.add_development_dependency(%q<rcov>, ["= 0.9.8"])
      s.add_development_dependency(%q<cucumber>, ["= 0.10.1"])
      s.add_development_dependency(%q<will_paginate>, ["= 3.0.pre"])
      s.add_development_dependency(%q<ginger>, ["= 1.2.0"])
      s.add_development_dependency(%q<faker>, ["= 0.3.1"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.3"])
      s.add_dependency(%q<riddle>, [">= 1.3.3"])
      s.add_dependency(%q<mysql>, ["= 2.8.1"])
      s.add_dependency(%q<pg>, ["= 0.9.0"])
      s.add_dependency(%q<actionpack>, [">= 3.0.3"])
      s.add_dependency(%q<jeweler>, ["= 1.5.1"])
      s.add_dependency(%q<yard>, ["= 0.6.8"])
      s.add_dependency(%q<rspec>, ["= 2.5.0"])
      s.add_dependency(%q<rspec-core>, ["= 2.5.0"])
      s.add_dependency(%q<rspec-expectations>, ["= 2.5.0"])
      s.add_dependency(%q<rspec-mocks>, ["= 2.5.0"])
      s.add_dependency(%q<rcov>, ["= 0.9.8"])
      s.add_dependency(%q<cucumber>, ["= 0.10.1"])
      s.add_dependency(%q<will_paginate>, ["= 3.0.pre"])
      s.add_dependency(%q<ginger>, ["= 1.2.0"])
      s.add_dependency(%q<faker>, ["= 0.3.1"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.3"])
    s.add_dependency(%q<riddle>, [">= 1.3.3"])
    s.add_dependency(%q<mysql>, ["= 2.8.1"])
    s.add_dependency(%q<pg>, ["= 0.9.0"])
    s.add_dependency(%q<actionpack>, [">= 3.0.3"])
    s.add_dependency(%q<jeweler>, ["= 1.5.1"])
    s.add_dependency(%q<yard>, ["= 0.6.8"])
    s.add_dependency(%q<rspec>, ["= 2.5.0"])
    s.add_dependency(%q<rspec-core>, ["= 2.5.0"])
    s.add_dependency(%q<rspec-expectations>, ["= 2.5.0"])
    s.add_dependency(%q<rspec-mocks>, ["= 2.5.0"])
    s.add_dependency(%q<rcov>, ["= 0.9.8"])
    s.add_dependency(%q<cucumber>, ["= 0.10.1"])
    s.add_dependency(%q<will_paginate>, ["= 3.0.pre"])
    s.add_dependency(%q<ginger>, ["= 1.2.0"])
    s.add_dependency(%q<faker>, ["= 0.3.1"])
  end
end
