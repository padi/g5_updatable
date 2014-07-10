module G5Updatable
  class Location < ActiveRecord::Base
    include G5Updatable::FirstClassProperties

    validates :uid, :urn, :client_uid, presence: true
  end
end
