class RemoveReferenceFromNauticalSport < ActiveRecord::Migration[5.0]
  def change
    remove_reference :nautical_sports, :user, foreign_key: true
  end
end
