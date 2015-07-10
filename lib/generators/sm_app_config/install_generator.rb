module SmAppConfig
  class InstallGenerator < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path("../../templates", __FILE__)
    end

    desc "install", "Copies configuration files to config/"
    method_options rails: true, desc: "Add Rails environments to configuration files"
    def install
      copy_app_config
      copy_app_config_example
      add_app_config_to_gitignore
    end

    desc "copy_app_config", "Copies app_config.yml to config/"
    def copy_app_config
      copy_file config_template, "config/app_config.yml"
      say "Copied app_config.yml to config/"
    end

    desc "copy_app_config_example", "Copies app_config.example.yml to config/"
    def copy_app_config_example
      copy_file config_template, "config/app_config.example.yml"
      say "Copied app_config.example.yml to config/"
    end

    desc "add_app_config_to_gitignore", "Adds app_config.yml to .gitignore"
    def add_app_config_to_gitignore
      append_to_file ".gitignore", "\n/config/app_config.yml"
      say "Added /config/app_config.yml to .gitignore"
    end

    private

    def config_template
      @template ||= options[:rails] ? "rails_app_config.yml" : "app_config.yml"
    end

  end
end