class Game < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  has_many :events
  has_many :olympian_events, through: :events
end
