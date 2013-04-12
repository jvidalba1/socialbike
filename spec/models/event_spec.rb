# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  date        :string(255)
#  estado      :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Event do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong!
    @event = Event.new(:estado => 1,
                       :date => "12/04/2013",
                       :name => "Cerro",
                       :description =>  "Lorem ipsum",
                       :user_id => user.id)
  end

  subject { @event }

  it { should respond_to(:description) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @event.user_id = nil }
    it { should_not be_valid }
  end
end
