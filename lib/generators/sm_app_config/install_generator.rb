module AppConfig
  class Install < Thor::Group
    include Thor::Actions

    desc "Copies configuration files to config/"

    def self.source_root
      File.expand_path("../../templates", __FILE__)
    end

    def copy_app_config
      copy_file config_template, "config/app_config.yml"
      say "Copied app_config.yml to config/"
    end

    def copy_app_config_example
      copy_file config_template, "config/app_config.example.yml"
      say "Copied app_config.example.yml to config/"
    end

    def add_app_config_to_gitignore
      append_to_file ".gitignore", "\n/config/app_config.yml"
      say "Added /config/app_config.yml to .gitignore"
    end

    private

    def config_template
      defined?(Rails) ? "rails_app_config.yml" : "app_config.yml"
    end

  end
end