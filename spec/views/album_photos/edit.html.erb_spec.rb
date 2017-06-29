require 'rails_helper'

RSpec.describe "album_photos/edit", type: :view do
  before(:each) do
    @album_photo = assign(:album_photo, AlbumPhoto.create!())
  end

  it "renders the edit album_photo form" do
    render

    assert_select "form[action=?][method=?]", album_photo_path(@album_photo), "post" do
    end
  end
end
