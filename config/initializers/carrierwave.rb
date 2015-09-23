CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['aws_access_key_id'],                        # required
    aws_secret_access_key: ENV['aws_secret_access_key'],                         # required
    region:                'eu-west-2'
  }
   # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  # To let CarrierWave work on heroku
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory = ENV['taylorharrisproject2']
end

