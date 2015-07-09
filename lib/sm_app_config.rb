require "sm_app_config/version"
require "sm_app_config/configuration"
require "sm_app_config/app_config"

module SmAppConfig
  extend self

  CONFIG = Configuration.new

  def configure configuration_options = {}
    CONFIG.merge!(configuration_options)
  end

  def clear!
    CONFIG.clear
  end

end
