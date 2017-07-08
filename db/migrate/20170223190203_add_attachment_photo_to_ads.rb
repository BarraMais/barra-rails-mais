class AddAttachmentPhotoToAds < ActiveRecord::Migration
  def self.up
    change_table :ads do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :ads, :photo
  end
end
