namespace :docker do
  APP_NAME = Rails.application.class.parent_name.underscore

  namespace :db do
    db_name = "postgres_#{APP_NAME}"
    desc "Create Development/Test Postgres Container"
    task :create do
      system("docker run --name #{db_name} -p 5432:5432 -d postgres:9.3.5")
    end
    desc "Destroy Dev/Test Postgres Container"
    task :stop do
      system("docker stop #{db_name}")
    end
    task :destroy do
      Rake::Task["docker:db:stop"].invoke
      system("docker rm #{db_name}")
    end
  end
  desc "Create Application Docker image"
  task :build do
    system("docker build -t #{app_name} .")
  end
end

namespace :servers do
  desc "provision"
  task :provision do
    if ENV['DO_CLIENT_KEY'].blank? && ENV['DO_API_KEY'].blank?
      raise "DO_CLIENT_KEY and DO_API_KEY must be set in your environment"
    else

    end
  end
end
