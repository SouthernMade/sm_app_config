require 'yaml'

class AppConfig

  def self.[] key
    result = ENV[key.upcase]
    return YAML.load(result) unless result.nil?

    result = config[key]
    return result unless result.nil?

    raise ArgumentError.new("No ENV['#{key.upcase}'] or AppConfig['#{key}'] setting found")
  end

  def self.reload!
    @config = nil
  end

  private

  def self.config
    @config ||= begin
      raw_config = File.read(config_file)
      loaded = YAML.load(raw_config)

      if defined?(Rails)
        loaded[Rails.env] or raise "No configuration found for environment #{Rails.env}"
      else
        loaded
      end
    rescue SystemCallError
      raise "No configuration file found at #{config_file}"
    end
  end

  def self.config_file
    SmAppConfig::CONFIG.fetch(:path)
  end

end