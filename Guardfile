require 'dotenv'
Dotenv.load

#guard :bundler do
  #require 'guard/bundler'
  #require 'guard/bundler/verify'
  #helper = Guard::Bundler::Verify.new

  #files = ['Gemfile']
  #files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }

  #files.each { |file| watch(helper.real_path(file)) }
#end

#guard 'rails' do
  #watch('Gemfile.lock')
  #watch(%r{^(config|lib)/.*})
#end

group :rspec, halt_on_fail: true do
  guard :rspec, cmd: "bundle exec rspec" do
    require "guard/rspec/dsl"
    dsl = Guard::RSpec::Dsl.new(self)


    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec_dir }
    watch(rspec.spec_files)

    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files)

    rails = dsl.rails(view_extensions: %w(erb haml slim))
    dsl.watch_spec_files_for(rails.app_files)
    dsl.watch_spec_files_for(rails.views)

    watch(rails.controllers) do |m|
      [
        rspec.spec.("routing/#{m[1]}_routing"),
        rspec.spec.("controllers/#{m[1]}_controller"),
        rspec.spec.("acceptance/#{m[1]}")
      ]
    end

    watch(rails.spec_helper)     { rspec.spec_dir }
    watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
    watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

    watch(rails.view_dirs)     { |m| rspec.spec.("features/#{m[1]}") }

    watch(%r{^spec/acceptance/(.+)\.feature$})
    watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
      Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
    end
  end
end

group :livereload do
  guard 'livereload' do
    watch(%r{app/views/.+\.(erb|haml|slim)$})
    watch(%r{app/assets/stylesheets/.+\.(scss|sass|css)$})
    watch(%r{app/assets/javascripts/.+\.(js|coffee)$})
    watch(%r{app/helpers/.+\.rb})
    watch(%r{public/.+\.(css|js|html)})
    watch(%r{config/locales/.+\.yml})
    #watch(%r{(app|vendor)(/assets/\w+/(.+\.(scss|sass|css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
  end
end
