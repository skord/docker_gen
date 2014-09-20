require 'rails/generators'
module DockerGen
  class PostgresGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)
    desc "Creates an fleet template for postgres"
    def copy_config_file
      empty_directory "config/cloud"
      template "postgres@.service", "config/cloud/postgres@.service"
      template "postgres-discovery@.service", "config/cloud/postgres-discovery@.service"
    end
  end
end
