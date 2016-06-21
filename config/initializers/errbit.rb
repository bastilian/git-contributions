if ENV['ERRBIT_HOST'] && ENV['ERRBIT_KEY'] && defined?(Airbrake)
  Airbrake.configure do |config|
    config.host = ENV['ERRBIT_HOST']
    config.project_id = -1
    config.project_key = ENV['ERRBIT_KEY']
  end
end
