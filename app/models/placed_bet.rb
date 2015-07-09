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

class PlacedBet < ActiveRecord::Base
  validates_presence_of :user_id, :bet_id
  belongs_to :better, class_name: "User", foreign_key: :user_id
  belongs_to :bet
end
