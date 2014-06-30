require "spec_helper"
require "generators/g5_updatable/install/install_generator"

describe G5Updatable::InstallGenerator, type: :generator do
  destination File.expand_path("../../../tmp", __FILE__)
  arguments %w()

  before do
    prepare_destination
    setup_routes
    run_generator
  end

  it "should copy the g5_updatable initializer" do
    expect(destination_root).to have_structure {
      directory "config" do
        directory "initializers" do
          file "g5_updatable.rb" do
            contains "G5Updatable.setup do |config|"
          end
        end
      end
    }
  end

  it "should mount the engine" do
    expect(destination_root).to have_structure {
      directory "config" do
        file "routes.rb" do
          contains "mount G5Updatable::Engine => '/g5_updatable'"
        end
      end
    }
  end

  def setup_routes
    routes = <<-END
      Rails.application.routes.draw do
        resource :home, only: [:show, :index]

        match "/some_path", to: "controller#action", as: :my_alias

        root to: "home#index"
      end
    END
    config_dir = File.join(destination_root, "config")

    FileUtils.mkdir_p(config_dir)
    File.write(File.join(config_dir, "routes.rb"), routes)
  end
end
