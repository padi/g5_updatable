require "virtus"

class G5Updatable::G5Client
  include Virtus.model

  attribute :name, String
  attribute :vertical, String
  attribute :domain, String
  attribute :type, String
end
