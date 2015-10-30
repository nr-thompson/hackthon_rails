OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do

	provider :facebook, "1004400616289085", "270d52f8701ce09dfad6579afcb8de11", :scope => 'email', :provider_ignores_state => true


end