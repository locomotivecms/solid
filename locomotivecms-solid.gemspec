# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "solid/version"

Gem::Specification.new do |s|
  s.name        = "locomotivecms-solid"
  s.version     = Solid::VERSION
  s.authors     = ["Jean Boussier", "Yannick François", "Didier Lafforgue"]
  s.email       = ["jean.boussier@tigerlilyapps.com", "yannick@tigerlilyapps.com", "didier.lafforgue@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Helpers for easily creating custom Liquid tags and block}
  s.description = %q{The Solid gem from the TigerLily team but modified to work with LocomotiveCMS}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "i18n"
  s.add_development_dependency "ruby_parser", "~> 3.2"
  s.add_development_dependency "activesupport", "~> 4.2"

  # TODO
  s.add_runtime_dependency "locomotivecms-liquid", "~> 4.0.0"
end
