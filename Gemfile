source 'https://rubygems.org'

ruby '2.2.1'

gem 'spree', github: 'spree/spree', branch: '3-0-stable'
# Provides basic authentication functionality for testing parts of your engine
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: '3-0-stable'
gem 'spree_product_packages', :git => "https://github.com/radamnyc/spree_product_packages.git"

group :development, :test do
  # for testing because we use a dummy installation of rails to run spec
  gem 'pg'
end


gemspec
