require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path for dealership index page', {:type => :feature}) do
  it('user clicks on link for dealership list') do
    visit('/')
    click_link('See Dealership List')
    expect(page).to have_content('Dealerships')
  end

  it('user clicks on link for add new dealership') do
    visit('/')
    click_link('Add New Dealership')
    expect(page).to have_content('Add dealerships')
  end
end

describe('path for dealership form page', {:type => :feature}) do
  it('user fills-in name of dealership and clicks add dealership') do
    visit('/dealerships/new')
    fill_in('name', with: "bobs cars")
    click_button('Add Dealership')
    expect(page).to have_content('Dealerships')
  end

  it('user clicks inlink for added dealership') do
    visit('/dealerships/1')
    click_link('Add a new vehicle')
    expect(page).to have_content('Add a vehicle to bobs cars')
  end
end
