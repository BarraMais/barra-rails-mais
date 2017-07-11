class AddAttachmentPhotoBToClassifieds < ActiveRecord::Migration
  def self.up
    change_table :classifieds do |t|
      t.attachment :photo_b
    end
  end

  def self.down
    remove_attachment :classifieds, :photo_b
  end
end
