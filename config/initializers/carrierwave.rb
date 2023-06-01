CarrierWave.configure do |config|
  config.storage = :file
  config.enable_processing = false if Rails.env.test?

  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      provider: ENV.fetch('AWS_PROVIDER', nil),
      aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil),
      aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil),
      region: ENV.fetch('AWS_REGION', nil)
    }
    config.fog_directory = ENV.fetch('AWS_DIRECTORY', nil)
    config.fog_public = false
  end
end
