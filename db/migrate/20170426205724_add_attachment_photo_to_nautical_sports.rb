class AddAttachmentPhotoToNauticalSports < ActiveRecord::Migration
  def self.up
    change_table :nautical_sports do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :nautical_sports, :photo
  end
end
