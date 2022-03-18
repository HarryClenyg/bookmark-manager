require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.view_list' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks VALUES (1, 'http://www.makersacademy.com', 'Makers');")
      connection.exec("INSERT INTO bookmarks VALUES (2, 'http://www.destroyallsoftware.com', 'DestroyAllSoftware');")
      connection.exec("INSERT INTO bookmarks VALUES (3, 'http://www.google.com', 'Google');")


      bookmarks = Bookmark.view_list

      expect(bookmarks[0].title).to include "Makers"
      expect(bookmarks[1].title).to include "DestroyAllSoftware"
      expect(bookmarks[2].title).to include "Google"
    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end
end