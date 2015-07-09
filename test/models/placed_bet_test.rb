# == Schema Information
#
# Table name: placed_bets
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  bet_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PlacedBetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
