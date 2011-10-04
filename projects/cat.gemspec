# -*- encoding: utf-8 -*-

$:.push File.expend_path("../lib",__FILE__)
require "cat/version"

Gem::Specifications.new do |s|
	s.name 			= "cat"
	s.version   	= cat::VERSION
	s.authors   	= ["Katharina Hayer"]
	s.email     	= ["katharinaehayer@gmail.com"]
	s.homepage  	= ""
	s.summary 		= %q{cat - My first Gem}
	s.description 	= %q{cat is a simple test}

	s.rubyforge_project = "cat"

	s.files 		= `git ls-files`.split("\n")
	s.test_files	= `git ls-files -- {test,spec,features}/*`.split("\n")
	s.executables	= `git ls-files -- bin/*`.split("\n").map {|f| File.basename(f)}
	s.require_paths = ["lib"]
end