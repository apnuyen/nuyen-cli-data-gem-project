
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "best_books/version"

Gem::Specification.new do |spec|
  spec.name          = "best-books"
  spec.version       = BestBooks::VERSION
  spec.authors       = ["An Nuyen"]
  spec.email         = ["annuyen@gmail.com"]

  spec.summary       = %q{This application shows you a list of the best book of 2017, according to the New York Times. After viewing the list, you can select a book and view more details about it.}
  spec.homepage      = "https://github.com/apnuyen/nuyen-cli-data-gem-project/tree/master/best-books"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "Nokogiri"
end
