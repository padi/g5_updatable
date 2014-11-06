class G5Updatable::LocationSerializer < ActiveModel::Serializer
  attributes :uid, :urn, :client_uid

  def filter(keys)
    object.properties.each do |name, value|
      keys.push(name.to_sym)
      define_singleton_method(name.to_sym) { value }
    end

    keys
  end
end
