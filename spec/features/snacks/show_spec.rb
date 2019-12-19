require 'rails_helper'

RSpec.describe "Snack #show" do
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

  context "When a user visits the snack show page" do
    before { visit "/snacks/#{@snack_1.id}" }

    it "they see the name for that snack" do
      expect(page).to have_content(@snack_1.name)
    end

    it "they see the cost for that snack" do
      expect(page).to have_content(@snack_1.cost)
    end

    xit "they see a list of vending machines that carry the snack" do
      # use "id : location"
      expect(page).to have_content(@machine_1.location)
    end

    xit "they see the average cost for the snacks in those vending machines" do
      expect(page).to have_content("average cost: 150")
    end

    xit "they see a count of the different types of items in those vending machines" do
      expect(page).to have_content("types: 2")
    end

  end
end