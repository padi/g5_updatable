module G5Updatable
  class IntegrationSetting < ActiveRecord::Base
    include G5Updatable::FirstClassProperties

    validates :location_uid, presence: true

    INVENTORY = 'inventory'
    LEAD      = 'lead'

    scope :by_vendor_action, -> (vendor_action) { where(vendor_action: vendor_action) }
    scope :by_inventory, -> { by_vendor_action(INVENTORY) }
    scope :by_lead, -> { by_vendor_action(LEAD) }

    def location
      @client ||= G5Updatable::Location.find_by_uid(location_uid)
    end
  end
end
