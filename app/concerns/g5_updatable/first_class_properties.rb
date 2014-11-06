module G5Updatable::FirstClassProperties
  extend ActiveSupport::Concern

  included do
    after_initialize :define_methods_for_properties
  end

  def properties=(hash)
    write_attribute("properties", hash)
    define_methods_for_properties
  end

protected

  def define_methods_for_properties
    return unless properties.present?

    properties.each do |key, value|
      next if respond_to?(key)
      define_singleton_method(key) do
        properties[key.to_s] if properties.present?
      end
    end
  end
end
