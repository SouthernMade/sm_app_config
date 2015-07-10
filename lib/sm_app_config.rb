require "sm_app_config/version"
require "sm_app_config/configuration"
require "sm_app_config/app_config"

module SmAppConfig
  extend self

  attr_accessor :configuration

  def configuration
    @configuration ||= Configuration.new
  end

  def configure(configuration_options = {})
    configuration.merge!(configuration_options)
  end

  def clear!
    configuration.clear
  end

  def config_file
    configuration.fetch(:path)
  end
end
