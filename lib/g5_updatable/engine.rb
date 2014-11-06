module G5Updatable
  class Engine < ::Rails::Engine
    isolate_namespace G5Updatable

    config.autoload_paths << G5Updatable::Engine.root.join("lib")

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end

  def self.setup(&block)
    yield self
  end
end
