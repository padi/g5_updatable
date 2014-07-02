require "virtus"

class G5Updatable::G5Location
  include Virtus.model

  attribute :uid, String
  attribute :urn, String
  attribute :name, String
  attribute :domain, String
  attribute :street_address, String
  attribute :state, String
  attribute :city, String
  attribute :neighborhood, String
  attribute :postal_code, String
  attribute :phone_number, String
  attribute :default_number, String
  attribute :corporate, String
  attribute :floor_plans, String
  attribute :primary_amenity, String
  attribute :qualifier, String
  attribute :primary_landmark, String
end
