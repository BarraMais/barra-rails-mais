class AddAttachmentPhotoAToClassifieds < ActiveRecord::Migration
  def self.up
    change_table :classifieds do |t|
      t.attachment :photo_a
    end
  end

  def self.down
    remove_attachment :classifieds, :photo_a
  end
end
