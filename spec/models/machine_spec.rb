require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "relationships" do
    it { should have_many(:machine_snacks) }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  # instance methods
  describe 'methods' do
    it "can calculate the average cost of its snacks" do
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
      expect(@machine_1.average_snack_cost).to eq(150)
    end
  end
end
