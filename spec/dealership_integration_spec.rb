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
