require "rails/generators"

class G5Updatable::InstallGenerator < Rails::Generators::Base
  def mount_engine
    route "mount G5Updatable::Engine => '/g5_updatable'"
  end
end
