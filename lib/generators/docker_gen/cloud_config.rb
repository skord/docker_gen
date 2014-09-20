require 'rails/generators'
module DockerGen
  class CloudConfigGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)
    desc "Creates a cloud config file for your machines to be"
    def copy_config_file
      empty_directory "config/cloud"
      template "cloud_config.yml", "config/cloud/cloud_config.yml"
    end
  end
  class DigitalOceanConfigGenerator < Rails::Generators::Base
    attr_accessor :preferred_zone_id
    source_root File.expand_path("../../templates", __FILE__)
    desc "Creates a digital ocean config file with your preferred settings"
    def create_config_file
      empty_directory "config/cloud"
      create_file "config/cloud/digital_ocean_config.yml" do
        preferred_zone_id = ask("What is your preferred zone ID? #{DockerGen::DigitalOcean::Regions.pretty_list}")
        "---\npreferred_zone_id: #{preferred_zone_id.to_s}\ninstance_size: 62\n"
      end
    end
  end
end
