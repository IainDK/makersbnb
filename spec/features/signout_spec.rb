feature 'User signs out' do

  let!(:user) do
    User.create(first_name: 'test-first',
                last_name: 'test-last',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
    expect(page).to have_content "Welcome back to Makers BnB #{user.email}"
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    #expect(page).not_to have_content('Welcome, test@test.com')
  end

end
