# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{public_rescue}
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Cyril Picard"]
  s.date = %q{2011-05-04}
  s.description = %q{PublicRescue is a gem for rails application who want to display dynamic error pages. It creates a new Rack middleware which replaces ActionDispatch::ShowExceptions and overwrites the rescue_action_in_public method.}
  s.email = %q{Cyril@picard.ch}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/controllers/public_rescue/public_errors_controller.rb",
    "app/views/public_rescue/public_errors/internal_server_error.html.erb",
    "app/views/public_rescue/public_errors/not_found.html.erb",
    "app/views/public_rescue/public_errors/unprocessable_entity.html.erb",
    "lib/generators/public_rescue/public_rescue_generator.rb",
    "lib/generators/public_rescue/views_generator.rb",
    "lib/generators/template/controller.rb",
    "lib/public_rescue.rb",
    "lib/public_rescue/rails.rb",
    "lib/public_rescue/show_exceptions.rb",
    "public_rescue.gemspec",
    "test/helper.rb",
    "test/test_public_rescue.rb"
  ]
  s.homepage = %q{http://github.com/cyrilpic/public_rescue}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Rails3 gem for displaying dynamic error pages.}
  s.test_files = [
    "test/helper.rb",
    "test/test_public_rescue.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end
