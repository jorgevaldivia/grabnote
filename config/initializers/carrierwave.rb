# Configure carrierwave options, specifically s3 credentials
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                         # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],      # required
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],  # required
    :region                 => ENV["AWS_REGION"],             # optional, defaults to 'us-east-1'
    #:host                   => 's3.example.com',             # optional, defaults to nil
    #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = ENV["AWS_BUCKET"]                        # required
  #config.fog_public     = false                                   # optional, defaults to true
  #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end