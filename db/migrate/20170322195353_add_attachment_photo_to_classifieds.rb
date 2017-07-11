class AddAttachmentPhotoToClassifieds < ActiveRecord::Migration
  def self.up
    change_table :classifieds do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :classifieds, :photo
  end
end
