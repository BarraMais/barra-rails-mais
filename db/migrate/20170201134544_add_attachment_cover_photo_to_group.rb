class AddAttachmentCoverPhotoToGroup < ActiveRecord::Migration

  def self.up
    change_table :groups do |t|
      t.attachment :cover_photo
    end
  end

  def self.down
    remove_attachment :groups, :cover_photo
  end

end
