module G5Updatable
  class Client < ActiveRecord::Base
    include G5Updatable::FirstClassProperties
    include G5Updatable::UrnAsParameter

    validates :uid, :urn, presence: true
  end
end
