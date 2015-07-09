require 'forwardable'

module SmAppConfig

  class Configuration
    extend Forwardable
    def_delegators :@hash, :to_hash, :[], :[]=, :==, :fetch, :delete

    DEFAULTS = {
      path: "config/app_config.yml"
    }

    def initialize
      clear
    end

    def clear
      @hash = DEFAULTS.dup
    end

    def merge! configuration_hash
      @hash.merge!(configuration_hash)
    end

  end

end