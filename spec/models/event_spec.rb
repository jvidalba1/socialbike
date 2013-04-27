# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  date        :date(255)
#  estado      :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Event do

  let(:user) { FactoryGirl.create(:user) }
  before { @event = user.events.build(:estado => 1,
                                      :date => "12/04/2013",
                                      :name => "Cerro",
                                      :description =>  "Lorem ipsum") }

  subject { @event }

  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  it { should be_valid }

  describe "when user_id is not present" do
    before { @event.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank date" do
    before { @event.date = " " }
    it { should_not be_valid }
  end

  describe "with date that is too long" do
    before { @event.date = "a" * 11 }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @event.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @event.description = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with blank estado" do
    before { @event.estado = " " }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @event.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @event.name = "a" * 16 }
    it { should_not be_valid }
  end

end
