CarrierWave.configure do |config|

	if Rails.env.test? || Rails.env.development?
		config.storage				= :file
		config.enable_processing	= true
		config.root					= "#{Rails.root}/public"
	elsif Rails.env.production?
		config.storage				= :fog
		config.enable_processing	= true

		config.fog_credentials = {
			provider:              'AWS',							# required
			aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],		# required
			aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],	# required
			region:                'ap-south-1',					# optional, defaults to 'us-east-1'
		}
	end

	config.fog_public     = false		# optional, defaults to true
	config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
