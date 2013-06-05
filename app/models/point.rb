# == Schema Information
#
# Table name: points
#
#  id               :integer          not null, primary key
#  Tracksegment_id  :integer
#  name             :string(255)
#  latitude         :float
#  longitude        :float
#  elevation        :float
#  description      :string(255)
#  point_created_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Point < ActiveRecord::Base
  belongs_to :Tracksegment
  attr_accessible :description, :elevation, :latitude, :longitude, :name, :point_created_at


end
