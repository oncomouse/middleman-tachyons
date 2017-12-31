# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
	prefix.browsers = "last 2 versions"
end

activate :livereload, host: "0.0.0.0"
activate :sprockets

set :markdown_engine, :kramdown
set :markdown, :fenced_code_blocks => true,
               :autolink => true,
               :smartypants => true,
               :footnotes => true,
               :superscript => true

# GH Pages Support:
set :build_dir, "docs"

if defined? RailsAssets
	RailsAssets.load_paths.each do |path|
		sprockets.append_path path
		compass_config do |config|
			config.add_import_path path
		end
	end
end

set :haml, { :format => :html5 }
Haml::TempleEngine.disable_option_validator!

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#	 '/this-page-has-no-template.html',
#	 '/template-file.html',
#	 locals: {
#		 which_fake_page: 'Rendering a fake page with a local variable'
#	 },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#	 def some_helper
#		 'Helping'
#	 end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
	activate :minify_css
	activate :minify_javascript
	activate :minify_html
	set :http_prefix, "/mla18/"
end
