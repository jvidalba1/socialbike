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

require 'spec_helper'

describe Point do
  pending "add some examples to (or delete) #{__FILE__}"
end
