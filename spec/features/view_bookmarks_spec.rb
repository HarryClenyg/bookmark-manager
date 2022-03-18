require 'pg'

feature 'viewing bookmarks' do
  scenario '/bookmarks enables user to view bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'DestroyAllSoftware');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")

    visit('/bookmarks')

    expect(page).to have_content "Makers"
    expect(page).to have_content "DestroyAllSoftware"
    expect(page).to have_content "Google"
  end
end
