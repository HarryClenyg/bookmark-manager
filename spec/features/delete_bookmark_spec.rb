require 'pg'
require_relative 'web_helpers'

feature 'delete bookmark' do
  scenario 'deletes selected bookmark from database' do
    add_bookmark
    click_on 'Delete'
    expect(page).to_not have_content 'Youtube'
  end
end
