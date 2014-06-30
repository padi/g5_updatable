require "rails/generators"

class G5Updatable::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def copy_initializer_file
    copy_file "g5_updatable.rb", "config/initializers/g5_updatable.rb"
  end

  def mount_engine
    route "mount G5Updatable::Engine => '/client_feed'"
  end
end
