require 'spec_helper'

feature "list a Space" do

  let!(:user) do
    User.create(email: 'user@example.co.uk', password: 'apple', password_confirmation: 'apple')
  end


  it "As a signed in host, so my space is available for rent, I can list a single space." do

    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
    expect(page).to have_content "Welcome back to Makers BnB #{user.email}"

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


  it "I cannot list a single space if I am not signed in." do

    visit "/spaces/new"
    fill_in :name, with: 'Beautiful Relaxing Space'
    fill_in :description, with: 'have fun at our BnB'
    fill_in :price, with: "50"
    fill_in :available_from, with: '01/01/2017'
    fill_in :available_to, with: '07/07/2017'
    click_button 'List my Space'
    expect(current_path).to eq '/spaces'
    expect(page).not_to have_content('Beautiful Relaxing Space')
    expect(page).to have_content('Please register or login to list a space')
  end



end
