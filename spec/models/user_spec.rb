require 'rails_helper'

describe User do
  it 'creates a new User with the name Chad' do
    user = FactoryBot.create(:user)
    user.username.should eq 'Chad'
  end

end
