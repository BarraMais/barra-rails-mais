class AddAttachmentPhotoToVessels < ActiveRecord::Migration
  def self.up
    change_table :vessels do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :vessels, :photo
  end
end
