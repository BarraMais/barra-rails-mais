require "rails_helper"

RSpec.describe "routes for Users", :type => :routing do
  context "save_avatar route" do
    let(:user) { FactoryGirl.create :user }

    it 'PUT user_controller#save_avatar' do
      expect(:put => user_save_avatar_path(user)).to route_to(
        controller: 'users',
        action: 'save_avatar',
        id: "#{user.id}"
      )
    end
  end
end
