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
      cost: 210
    )
    @machine_1.snacks << @snack_1
  }

  context "As a visitor I expect to see the machine's" do
    before { visit "/machines/#{@machine_1.id}" }
    it "snacks and their associated prices" do
      expect(page).to have_content("M&M")
      expect(page).to have_content("210")
    end

    xit "average price of all the snacks" do

    end
  end
end