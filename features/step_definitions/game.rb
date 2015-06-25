Given /^I'm in (.*)'s browser$/ do |name|
  Capybara.session_name = name
end

When /^I visit home page$/ do
  visit("/")
end

When(/^I click on "(.*?)" link$/) do |link|
  click_link link
end

Then(/^I enter "(.*?)" into Modal$/) do |name|
  sleep 1
  fill_in "game_player_name", with: name
  click_button "Submit"
  @game_url = current_url
end

And(/^I visit game page$/) do
  visit(@game_url)
end

And(/^I click "(.*?)" cell on gameboard$/) do |cell|
  sleep 2
  page.execute_script(%Q($("[data-cell='#{cell}']").click()));
end

Then(/^I should see game result on home page$/) do
  sleep 2
  expect(page).to have_content("Winner Rudi")
end