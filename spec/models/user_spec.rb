# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#  salt               :string(255)
#

require 'spec_helper'

describe User do

  before do
    @user = User.new(:name => "Example User", :email => "user@example.com",
                     :password => "123456", :password_confirmation => "123456")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "event associations" do

    before { @user.save }

    let!(:older_event) do
      FactoryGirl.create(:event, :user => @user, :created_at => 1.day.ago)
    end
    let!(:newer_event) do
      FactoryGirl.create(:event, :user => @user, :created_at => 1.hour.ago)
    end

    it "should have the right events in the right order" do
      @user.events.should == [newer_event, older_event]
    end

    it "should destroy associated events" do
      events = @user.events.dup
      @user.destroy
      events.should_not be_empty
      events.each do |event|
        Event.find_by_id(event.id).should be_nil
      end
    end
  end
end
