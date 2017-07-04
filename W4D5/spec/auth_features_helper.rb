module AuthFeaturesHelper

  def login_as(user)
    visit(new_user_url)
    fill_in("user_name", with: '#{user.user_name}')
    fill_in("password", with: 'password')
    click_button 'Create User'
  end
end
