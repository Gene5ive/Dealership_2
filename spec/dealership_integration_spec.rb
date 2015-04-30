require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path for dealership index page', {:type => :feature}) do
  it('links user to dealership list page') do
    visit('/')
    click_link('See Dealership List')
    expect(page).to have_content('Dealerships')
  end

  it('links user to add new dealership page') do
    visit('/')
    click_link('Add New Dealership')
    expect(page).to have_content('Add dealerships')
  end
end

describe('path for dealership form page', {:type => :feature}) do
  it('allows user to fill in name of dealership, click add dealership, and link to dealership list page') do
    visit('/dealerships/new')
    fill_in('name', with: "bobs cars")
    click_button('Add Dealership')
    expect(page).to have_content('Dealerships')
  end
end

describe('path for dealership list page', {:type => :feature}) do
  it('links user to page for list of cars in dealership') do
    visit('/dealerships')
    click_link('bobs cars')
    expect(page).to have_content('Here are all the cars in this dealership')
  end
end

describe('path for cars in dealership page', {:type => :feature}) do
  it('links user to add new vehicle form page') do
    visit('dealerships/1')
    click_link('Add a new vehicle')
    expect(page).to have_content('Add a vehicle to bobs cars')
  end
end

describe('path for add a vehicle page', {:type => :feature}) do
  it('allows user to fill in make, model, and year of car, click add vehicle, and link to success page') do
    visit('dealerships/1/vehicles/new')
    fill_in('Vehicle\'s make:', with: "Tesla")
    fill_in('Vehicle model:', with: "ModelS")
    fill_in('Vehicle\'s year:', with: "2012")
    click_button('Add Vehicle')
    expect(page).to have_content('Success!')
  end
end
