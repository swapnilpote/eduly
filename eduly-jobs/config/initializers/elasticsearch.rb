require 'faraday_middleware/aws_signers_v4'

aws_elasticsearch_host = ENV['AWS_ELASTICSEARCH_HOST']
aws_elasticsearch_key = ENV['AWS_ACCESS_KEY_ID']
aws_elasticsearch_secret = ENV['AWS_SECRET_ACCESS_KEY']


transport_configuration = lambda do |f|
    f.request :aws_signers_v4, credentials: Aws::Credentials.new(aws_elasticsearch_key, aws_elasticsearch_secret),
    service_name: 'es',
    region: 'ap-south-1'

    f.response :logger
    f.adapter Faraday.default_adapter
end

if Rails.env == 'production'
	transport = Elasticsearch::Transport::Transport::HTTP::Faraday.new hosts: [{ scheme: 'https', host: aws_elasticsearch_host, port: '443' }], &transport_configuration

	Searchkick.client = Elasticsearch::Client.new transport: transport
else
	url = 'http://localhost:9200/'
	Searchkick.client = Elasticsearch::Client.new(hosts: url, retry_on_failure: true, transport_options: {request: {timeout: 250}})
end
