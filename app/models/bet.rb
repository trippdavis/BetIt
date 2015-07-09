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

class Bet < ActiveRecord::Base
  validates_presence_of :title, :description, :bet_taker_id, :max_bets
  validates_inclusion_of :completed, :in => [true, false]
  belongs_to :bet_taker, class_name: "User", foreign_key: :bet_taker_id
  has_many :bets_placed, class_name: "PlacedBet"
  has_many :betters, through: :bets_placed, source: :betters
  has_many :taggings
  has_many :tags, through: :taggings, source: :tag
end
