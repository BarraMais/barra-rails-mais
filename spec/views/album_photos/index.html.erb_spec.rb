require 'rails_helper'

RSpec.describe "album_photos/index", type: :view do
  before(:each) do
    assign(:album_photos, [
      AlbumPhoto.create!(),
      AlbumPhoto.create!()
    ])
  end

  it "renders a list of album_photos" do
    render
  end
end
