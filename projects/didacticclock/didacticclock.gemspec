# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "didacticclock/version"

Gem::Specification.new do |s|
  s.name        = "didacticclock"
  s.version     = Didacticclock::VERSION
  s.authors     = ["Kaharina Hayer"]
  s.email       = ["katharinaehayer@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{First Gem Ever}
  s.description = %q{It doesnt do much}

  s.rubyforge_project = "didacticclock"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
