require 'rails_helper' 

RSpec.describe Snack, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
  end

  describe "relationships" do
    it { should have_many(:machine_snacks) }
    it { should have_many(:machines).through(:machine_snacks) }
  end

  # instance methods
  describe 'instance methods' do
    before {
      @owner_1 = Owner.create(
        name: "Bob"
      )
      @machine_1 = Machine.create(
        location: "Iowa",
        owner_id: @owner_1.id
      )
      @snack_1 = Snack.create(
        name: "M&Ms",
        cost: 200
      )
      @snack_2 = Snack.create(
        name: "Skittles",
        cost: 100
      )
      @machine_1.snacks << [@snack_1, @snack_2]
    }
    
    it "can report the location" do
      expect(@snack_1.find_all_locations).to eq(["Iowa"])
    end
  end
end