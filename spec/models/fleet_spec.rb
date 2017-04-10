require 'rails_helper'

RSpec.describe Fleet, type: :model do
  let(:city) { City.new(code: 22, name: "BARRANQUILLA") }
  subject { described_class.new(name: "ARS-5020", city_id: city) }
  
  describe "Validations" do
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end    
  end
end
