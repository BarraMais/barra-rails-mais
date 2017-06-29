class AddAttachmentPhotoToInterestAreas < ActiveRecord::Migration
  def self.up
    change_table :interest_areas do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :interest_areas, :photo
  end
end
