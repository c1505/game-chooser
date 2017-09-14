require "rails_helper"

feature 'game' do
  before(:each) do 
    @collection = Collection.create(name: "example")
  end
  
  scenario 'create game through api' do
    visit new_collection_game_path(@collection.id)
    fill_in "Name", :with => "Catan"
    click_button "Add Game"
    expect(page).to have_text "Catan added to your collection"
    expect(Game.last).to have_attributes(
      name: "Catan", 
      time: be_truthy, 
      geek_link: be_truthy,
      max_players: be_truthy,
      min_players: be_truthy,
      complexity: be_truthy,
      rating: be_truthy,
      geek_id: 13,
      image_link: be_truthy
    )
  end
  scenario 'multiple category and mechanic responses'
  scenario 'single category and mechanic responses'
end