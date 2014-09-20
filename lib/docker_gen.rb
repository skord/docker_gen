require 'rails'
require 'docker_gen/core_os_servers'

module DockerGen
  class Railtie < Rails::Railtie
    railtie_name :docker_gen

    rake_tasks do
      load "tasks/docker_gen_tasks.rake"
    end

    generators do
      require "generators/docker_gen/cloud_config.rb"
      require "generators/docker_gen/postgres.rb"
    end
  end
end
