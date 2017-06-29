class AddAttachmentCoverPhotoToEvent < ActiveRecord::Migration

  def self.up
    change_table :events do |t|
      t.attachment :cover_photo
    end
  end

  def self.down
    remove_attachment :events, :cover_photo
  end

end
