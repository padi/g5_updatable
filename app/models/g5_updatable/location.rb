module G5Updatable
  class Location < ActiveRecord::Base
    include G5Updatable::FirstClassProperties
    include G5Updatable::UrnAsParameter

    validates :uid, :urn, :client_uid, presence: true

    def client
      @client ||= G5Updatable::Client.find_by_uid(client_uid)
    end
  end
end
