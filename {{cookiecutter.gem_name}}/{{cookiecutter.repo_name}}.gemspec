
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cookiecutter/clean/ruby/app/version"

Gem::Specification.new do |spec|
  spec.name          = {{cookiecutter.gem_name}}
  spec.version       = {{cookiecutter.module_name}}::VERSION
  spec.authors       = [{{cookiecutter.author_name}}]
  spec.email         = [{{cookiecutter.author_email}}]

  spec.summary       = {{cookiecutter.summary}}
  spec.description   = {{cookiecutter.short_description}}
  spec.homepage      = "http://www.github.com/{{cookiecutter.github_user}}/{{cookiecutter.repo_name}}"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://www.github.com/{{cookiecutter.github_user}}/{{cookiecutter.repo_name}}"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "http://www.github.com/{{cookiecutter.github_user}}/{{cookiecutter.repo_name}}"
    spec.metadata["changelog_uri"] = "http://www.github.com/{{cookiecutter.github_user}}/{{cookiecutter.repo_name}}/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
