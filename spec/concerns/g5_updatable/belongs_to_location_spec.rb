require 'spec_helper'

describe G5Updatable::BelongsToLocation do
  describe "#location" do
    let(:location_uid) { "https://example.com/location_uid" }
    let(:favorite_food) { FavoriteFood.new(location_uid: location_uid) }
    subject { favorite_food.location }

    context "when the assocaited location_uid exists" do
      let!(:location) { FactoryGirl.create(:location, uid: location_uid) }
      it { should eq(location) }

      context "when the location_uid changes after it has already been fetched" do
        let!(:new_location) { FactoryGirl.create(:location) }
        before do
          favorite_food.location
          favorite_food.location_uid = new_location.uid
        end

        it { should eq(new_location) }
      end
    end

    context "when the assocaited location_uid does not exist" do
      it "raises a helpful exception" do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound, /example/)
      end
    end
  end
end
