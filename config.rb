# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Blog Settings

activate :blog do |blog|
  blog.prefix = 'blog'
end

set :port, 8080
set :source, './src/middleman'

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_html
  activate :gzip

  # All the .js assets already have the hash from webpack, so we skip them
  activate :asset_hash, ignore: ->(f){ f =~ /\.js/ && f != 'bundle.js' }
end

activate :external_pipeline,
    name: :webpack,
    command: build? ? 'npm run build' : 'npm run watch',
    source: 'dist',
    latency: 1

