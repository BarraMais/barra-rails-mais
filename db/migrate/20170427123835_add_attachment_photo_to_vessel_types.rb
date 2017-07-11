class AddAttachmentPhotoToVesselTypes < ActiveRecord::Migration
  def self.up
    change_table :vessel_types do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :vessel_types, :photo
  end
end
