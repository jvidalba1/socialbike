require 'spec_helper'

describe "UsersController" do

  describe "#create" do

    it 'creates a new user' do
      User.count.should == @count + 1
      flash[:success].should be("Bienvenido a socialbike")
    end
  end
end
