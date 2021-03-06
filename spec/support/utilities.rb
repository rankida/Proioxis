include ApplicationHelper

def full_title(page_title)
	base_title = "Proioxis"
	if page_title.nil? || page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}"
	end
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

def sign_in(user)
	visit '/signin'
	fill_in "Email",    with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"
	# Sign in when not using Capybara as well
	cookies[:remember_token] = user.remember_token
end
