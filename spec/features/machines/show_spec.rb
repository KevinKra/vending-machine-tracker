require 'rails_helper'

RSpec.describe "Machine #show" do
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

  context "As a visitor I expect to see the machine's" do
    before { visit "/machines/#{@machine_1.id}" }
    it "snacks and their associated prices" do
      expect(page).to have_content(@snack_1.name)
      expect(page).to have_content(@snack_1.cost)
      expect(page).to have_content(@snack_2.name)
      expect(page).to have_content(@snack_2.cost)
    end

    it "average price of all the snacks" do
      expect(page).to have_content("150")
    end
  end
end