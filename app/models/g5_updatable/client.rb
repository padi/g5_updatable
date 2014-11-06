module G5Updatable
  class Client < ActiveRecord::Base
    include G5Updatable::FirstClassProperties
    include G5Updatable::UrnAsParameter

    validates :uid, :urn, presence: true

    def locations
      G5Updatable::Location.where(client_uid: self.uid)
    end
  end
end
