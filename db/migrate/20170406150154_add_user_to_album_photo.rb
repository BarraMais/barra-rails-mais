class AddUserToAlbumPhoto < ActiveRecord::Migration[5.0]
  def change
    add_reference :album_photos, :user, foreign_key: true
  end
end
