require 'spec_helper'

feature "list a Space" do
  it "As a host, so my space is available for rent, I can list a single space." do
    visit "/spaces/new"
    fill_in :name, with: 'Beautiful Relaxing Space'
    fill_in :description, with: 'have fun at our BnB'
    fill_in :price, with: "50"
    fill_in :available_from, with: '01/01/2017'
    fill_in :available_to, with: '07/07/2017'
    click_button 'List my Space'
    expect(current_path).to eq '/spaces'
    expect(page).to have_content('Beautiful Relaxing Space')
    expect(page).to have_content('have fun at our BnB')
    expect(page).to have_content('50')
    expect(page).to have_content('1 January 2017')
    expect(page).to have_content('7 July 2017')
  end



end
