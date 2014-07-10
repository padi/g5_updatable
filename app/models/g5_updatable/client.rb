module G5Updatable
  class Client < ActiveRecord::Base
    include G5Updatable::FirstClassProperties

    validates :uid, :urn, presence: true
  end
end
