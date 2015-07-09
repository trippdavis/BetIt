# == Schema Information
#
# Table name: bets
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  bet_taker_id :integer          not null
#  max_bets     :integer          not null
#  completed    :boolean          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class BetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
