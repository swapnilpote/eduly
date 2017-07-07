Rails.application.config.middleware.use OmniAuth::Builder do
	if Rails.env == 'production'
		provider :facebook, '246364472428879', '6f17b091db4b8aa01b7c8fc0e4dd04df'
		provider :google_oauth2, '536894906471-76g8tamf6ocbbagfudjgn96i3itcqh38.apps.googleusercontent.com', '013Gs-shMfJjsNx0pGjEonSS'
	else
		provider :facebook, '1010760458993518', '5a802f1114c4f9d3a1a61d67ce9577b4'
		provider :google_oauth2, '1033197868374-eep4o90b5m01lo6frlkf1ij2qviupi8g.apps.googleusercontent.com', 'P6xPnJKJLlpLQoPCNZ5c6amb'
	end
end
