# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tf-idf_csv}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Julian Burgess"]
  s.date = %q{2010-11-18}
  s.default_executable = %q{tf-idf_csv}
  s.email = %q{jburgess@ap.org}
  s.executables = ["tf-idf_csv"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/tf-idf_csv",
     "lib/tf-idf_csv.rb",
     "test/helper.rb",
     "test/test_tf-idf_csv.rb",
     "tf-idf_csv.gemspec"
  ]
  s.homepage = %q{http://github.com/aubergene/tf-idf_csv}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Calculate the TF-IDF for terms in a CSV file}
  s.test_files = [
    "test/helper.rb",
     "test/test_tf-idf_csv.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

