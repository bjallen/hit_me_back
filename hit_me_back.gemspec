# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hit_me_back}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["B.J. Allen"]
  s.date = %q{2009-07-03}
  s.email = %q{bjallen@mac.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/hit_me_back.rb",
     "lib/hit_me_back/event.rb",
     "test/hit_me_back_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/bjallen/hit_me_back}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Hit Me Back is a simple subscribe/notify observer pattern framework.}
  s.test_files = [
    "test/hit_me_back_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
