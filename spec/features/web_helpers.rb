def add_bookmark
  visit('/bookmarks/new')
  fill_in('url', with: 'http://www.youtube.com')
  fill_in('title', with: 'Youtube')
  click_button('Add')
end