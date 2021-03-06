# frozen_string_literal: true

# name: discourse-login-with-amazon
# about: Enable Login via Login with Amazon
# version: 0.0.1
# authors: Alan Tan
# url: https://github.com/discourse/discourse-login-with-amazon

gem 'omniauth-amazon', '1.0.1'

if respond_to?(:register_svg_icon)
  register_svg_icon "fab-amazon"
end

register_asset 'stylesheets/login-with-amazon.scss'

[
  "../lib/auth/login_with_amazon_authenticator.rb",
  "../lib/validators/enable_login_with_amazon_validator.rb",
  "../lib/omniauth/strategies/amazon.rb",
].each { |path| load File.expand_path(path, __FILE__) }

auth_provider authenticator: Auth::LoginWithAmazonAuthenticator.new,
              icon: 'fab-amazon',
              frame_height: 600
