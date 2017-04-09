require 'rails_helper'

RSpec.describe Package, type: :model do
subject { described_class.new(user_id: 1,
                              order_status_id: 1,
                              bus_id: 1,
                              trackingid: "doe",
                              current_lat: 25.5,
                              current_lng: 23.3,
                              description: "hello",
                              origin_id: 1,
                              destination_id: 1,
                              weight: 20.5
                              ) }
  
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a trackingid" do
      subject.trackingid = nil
      expect(subject).to_not be_valid
    end
  end
end
