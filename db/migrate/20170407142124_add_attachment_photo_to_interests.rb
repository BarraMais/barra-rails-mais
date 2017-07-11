class AddAttachmentPhotoToInterests < ActiveRecord::Migration
  def self.up
    change_table :interests do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :interests, :photo
  end
end
