# == Schema Information
#
# Table name: tracks
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  gpx_file_name    :string(255)
#  gpx_content_type :string(255)
#  gpx_file_size    :integer
#  gpx_updated_at   :datetime
#

require 'spec_helper'

describe Track do
  pending "add some examples to (or delete) #{__FILE__}"
end
