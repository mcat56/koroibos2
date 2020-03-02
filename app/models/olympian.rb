class Olympian < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  validates_presence_of :sex, :age, :weight, :height
  belongs_to :team
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :games, through: :events
end
