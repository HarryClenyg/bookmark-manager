require 'pg'
require_relative 'web_helpers'

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    add_bookmark
    expect(page).to have_content 'Youtube'
  end
end