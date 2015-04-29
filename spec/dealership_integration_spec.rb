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
end
