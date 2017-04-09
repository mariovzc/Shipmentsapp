require 'rails_helper'

RSpec.describe Bus, type: :model do
  let(:fleet) { Fleet.new(name: "ARS-5020", city_id: 05) }
  subject { described_class.new(license_plate: "ARS-5020", fleet_id: fleet) }
  
  describe "Validations" do
    it "is not valid without a license_plate" do
      subject.license_plate = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an fleet" do
      subject.fleet = nil
      expect(subject).to_not be_valid
    end
  end
end
